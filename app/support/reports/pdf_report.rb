# encoding: utf-8

class PdfReport < Prawn::Document

  # ширина колонок
  Widths = [150, 150, 100, 50, 70]

  # заглавия колонок
  Headers = %w[Сотрудник Задание Проект Время Статус]

  def row(email, task, project, time, status)
    row = [email, task, project, time, status]
    make_table([row]) do |t|
      t.column_widths = Widths
    end
  end

  def to_pdf(params)
    # Устанавливает руссий шрифт
    font_families.update(
      "Verdana" => {
          bold: "#{Rails.root}/app/assets/fonts/verdana/verdanab.ttf",
        italic: "#{Rails.root}/app/assets/fonts/verdana/verdanai.ttf",
        normal: "#{Rails.root}/app/assets/fonts/verdana/verdana.ttf"
      }
    )
    font "Verdana", size: 9

    # выборка записей
    if params[:from_date].blank? && params[:to_date].blank?
      text "Отчет за #{Time.zone.now.strftime('%d %b %Y')}", size: 10, style: :bold, align: :left
      params[:from_date] = params[:to_date] = Date.today
      @time_entries = StatisticsFilter.new(params[:user_id], params).filter.to_a
    else
      text "Отчет за период с #{params[:from_date]} по #{params[:to_date]}", size: 10, style: :bold, align: :left
      @time_entries = StatisticsFilter.new(params[:user_id], params).filter.to_a
    end
    @time_entries.sort! do | te1, te2 |
      (te1.user ? te1.user.email : "Unknown user") <=> (te2.user ? te2.user.email : "Unknown user")
    end

    move_down(20)
    text "Racoons Group", size: 12, style: :bold, align: :center
    move_down(20)

    data = []
    time_entr = @time_entries.each do |te|
      if User.where(id: te.user_id).exists?
        email = User.find(te.user_id).email
      else
        email = "Unknown user"
      end

      data << row(
      email,
      te.name,
      te.project_name,
      te.real_time,
      te.status
      )
    end

    head = make_table([Headers], column_widths: Widths)

    table([[head], *(data.map{|d| [d]})], header: true) do
      row(0).style background_color: 'CCCCFF', text_color: '993300'
    end
    # добавляет время создания внизу, в углу страницы
    creation_date = Time.zone.now.strftime("Отчет сгенерирован %e %b %Y в %H:%M")
    go_to_page(page_count)
    move_down(710)
    text creation_date, align: :right, style: :italic, size: 9

    render

  end

end