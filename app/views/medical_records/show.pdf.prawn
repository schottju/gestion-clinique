pdf.bounding_box([0, 780], :width => 70, :height => 70) do
pdf.image "#{Rails.root}/app/assets/images/logo.png", height: 70
end
pdf.draw_text "CLINIQUE VÉTÉRINAIRE DE SAINT JUNIEN", :style => :bold, :size => 20, :at => [100, 750]
pdf.draw_text "Médecine, Imagerie, Chirurgie", :style => :bold, :size => 15, :at => [200, 730]
pdf.draw_text "Urgence assurée 24/24", :size => 12, :at => [230, 710]

pdf.draw_text " Saint Junien, le #{medical_record.created_at.to_date}", :size => 12, :at => [350, 690]
pdf.move_down 80

if medical_record.comments.blank?
 pdf.text "  "
else
  medical_record.comments.each do |comment|
  pdf.text "-  #{comment.comment}", :style => :bold, :indent_paragraphs => 150, :inline_format => true
end
end

medical_record.animals.each do |animal|
pdf.draw_text "Pour le #{animal.try(:species).try(:name)} #{animal.name} de #{proprio.last_name} #{proprio.first_name}", :style => :bold, :size => 12, :at => [150, 550]
end

pdf.move_down 100

medical_record.medicines.each do |medicine|
pdf.move_down 20
pdf.text "<u>#{medicine.name}</u>", :style => :bold, :size => 12, :inline_format => true
pdf.text "<u>#{medicine.decorate.name_with_medoc}</u>", :style => :bold, :size => 12, :inline_format => true
pdf.move_down 10
pdf.text "#{medicine.dosage}", :indent_paragraphs => 40
pdf.move_down 10
pdf.text "#{medicine.description}"

end

pdf.move_down 100
pdf.text "Docteur #{medical_record.veterinarian.user.last_name} #{medical_record.veterinarian.user.first_name}", :size => 12, :indent_paragraphs => 270
pdf.text "N° d'ordre : #{medical_record.veterinarian.pwz}", :size => 12, :indent_paragraphs => 280

pdf.draw_text "ZI de la Croix Blanche - 87 200 SAINT JUNIEN", :size => 12, :at => [150, 12]
pdf.draw_text "Tél : 05 55 02 17 52 - Fax : 05 55 02 68 28 - Courriel : clinvet-stjunien@wanadoo.fr", :size => 12, :at => [60, 0]
