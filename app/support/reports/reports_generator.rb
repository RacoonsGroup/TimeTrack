
class ReportsGenerator

  def self.generate_report_pdf
    @time_entries = TimeEntry.select { |te| te.created_at.day == Time.now.day }
    pdf = WickedPdf.new.pdf_from_string(
    render_to_string(pdf: "Name_pdf",
                     template: 'report_mailer/report.pdf.slim')
                    )
  end

end