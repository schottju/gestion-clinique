pdf.bounding_box([0, 780], :width => 70, :height => 70) do
pdf.image "#{Rails.root}/app/assets/images/logo.png", height: 70
end
pdf.draw_text "CLINIQUE VÉTÉRINAIRE DE SAINT JUNIEN", :style => :bold, :size => 20, :at => [100, 750]
pdf.draw_text "Médecine, Imagerie, Chirurgie", :style => :bold, :size => 15, :at => [200, 730]
pdf.draw_text "Urgence assurée 24/24", :size => 12, :at => [230, 710]

pdf.draw_text " Saint Junien, le #{hospit.created_at.to_date}", :size => 12, :at => [350, 690]
pdf.move_down 80
if hospit.comment.blank?
 pdf.text "  "
else
 pdf.text "<u>Remarque</u> : #{hospit.comment}", :style => :bold, :indent_paragraphs => 90, :inline_format => true
end
hospit.animals.each do |animal|
pdf.draw_text "Pour le #{animal.try(:species).try(:name)} #{animal.name} de #{proprio.last_name} #{proprio.first_name}", :style => :bold, :size => 12, :at => [150, 550]
end

pdf.move_down 100

hospit.hospitactes.each do |hospitacte|
pdf.move_down 20
pdf.text "<u>#{hospitacte.comment}</u>", :style => :bold, :size => 12, :inline_format => true
pdf.move_down 10
pdf.text "#{hospitacte.soin}", :indent_paragraphs => 40
pdf.move_down 10
pdf.text "Docteur #{hospitacte.veterinarian.user.last_name} #{hospitacte.veterinarian.user.first_name}", :size => 12

end

pdf.move_down 100
pdf.text "Docteur #{hospit.veterinarian.user.last_name} #{hospit.veterinarian.user.first_name}", :size => 12, :indent_paragraphs => 270
pdf.text "N° d'ordre : #{hospit.veterinarian.pwz}", :size => 12, :indent_paragraphs => 280

pdf.draw_text "ZI de la Croix Blanche - 87 200 SAINT JUNIEN", :size => 12, :at => [150, 12]
pdf.draw_text "Tél : 05 55 02 17 52 - Fax : 05 55 02 68 28 - Courriel : clinvet-stjunien@wanadoo.fr", :size => 12, :at => [60, 0]
