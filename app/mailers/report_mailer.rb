class ReportMailer < ActionMailer::Base
  default from: "from@example.com"

  def report_to_admin
    @time_entries = TimeEntry.select { |te| te.created_at.day == Time.now.day }

    attachments["Name.pdf"] = WickedPdf.new.pdf_from_string(
    render_to_string(pdf: "Name_pdf",
                     template: 'report_mailer/report.pdf.slim') )

    mail(:to => "admin@mail.com", :subject => "RE raccons")
  end

end