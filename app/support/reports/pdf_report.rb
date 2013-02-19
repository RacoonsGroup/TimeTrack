# encoding: utf-8

class PdfReport < Prawn::Document

  # ширина колонок
  Widths = [150, 150, 100, 50, 70]

  # заглавия колонок
  Headers = %w[Сотрудник Задание Проект Время Статус]

  def row(email = "Undef", task, project, time, status)
    row = [email, task, project, time, status]
    make_table([row]) do |t|
      t.column_widths = Widths
    end
  end

  def to_pdf(from, to)
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
    if from == nil && to == nil
      text "Отчет за #{Time.zone.now.strftime('%d %b %Y')}", size: 10, style: :bold, align: :left
      @time_entries = TimeEntry.select { |te| te.date.day == Time.zone.now.day }
    else
      text "Отчет за период с #{from} по #{to}", size: 10, style: :bold, align: :left
      @time_entries = TimeEntry.select {
        |te| from.to_time.day <= te.date.day && to.to_time.day >= te.date.day
      }
    end

    move_down(20)
    text "Racoons Group", size: 12, style: :bold, align: :center
    move_down(20)

    #@time_entries.sort! { | te1, te2 | User.find(te1.user_id).email <=> User.find(te2.user_id).email }
    data = []
    time_entr = @time_entries.each do |te|
        email = "Undefined user"
        if User.where(id: te.user_id).exists?
          email = User.find(te.user_id).email
        end

         data << row(
        email,
        te.name,
        te.project.project_name,
        te.real_time,
        te.status
        )
    end

    head = make_table([Headers], column_widths: Widths)

    table([[head], *(data.map{|d| [d]})], header: true) do
      row(0).style background_color: 'CCCCFF', text_color: '993300'
      #cells.style borders: []
    end
    # добавляет время создания внизу, в углу страницы
    creation_date = Time.zone.now.strftime("Отчет сгенерирован %e %b %Y в %H:%M")
    go_to_page(page_count)
    move_down(710)
    text creation_date, align: :right, style: :italic, size: 9

    render

  end

end