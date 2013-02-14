pdf.text "Awesome cowboy"

time_entr = @time_entries.map do |te|
  [
    User.find(te.user_id).email,
    te.name,
    te.project.project_name,
    te.real_time,
    te.status
  ]
end

pdf.table(time_entr,
  row_colors: ["F0F0F0", "FFFFCC"]
)