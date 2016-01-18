pdf.bounding_box([0, 780], :width => 70, :height => 70) do
pdf.image "#{Rails.root}/app/assets/images/logo.png", height: 70
end
pdf.draw_text "CLINIQUE VÉTÉRINAIRE DE SAINT JUNIEN", :style => :bold, :size => 20, :at => [100, 750]
pdf.draw_text "Médecine, Imagerie, Chirurgie", :style => :bold, :size => 15, :at => [200, 730]
pdf.draw_text "Urgence assurée 24/24", :size => 12, :at => [230, 710]

pdf.draw_text " Date d'hospitalisation #{hospit.created_at.to_date}", :size => 12, :at => [350, 680]
pdf.move_down 90
if hospit.anamnesis.blank?
 pdf.text "  "
else
 pdf.text "Cause de l'hospitalisation : #{hospit.anamnesis}", :style => :bold, :indent_paragraphs => 60, :inline_format => true
end
hospit.animals.each do |animal|
pdf.draw_text "Fiche d'hospitalisation du #{animal.try(:species).try(:name)} #{animal.name.titleize} de #{proprio.last_name.titleize} #{proprio.first_name.titleize}", :style => :bold, :size => 12, :at => [120, 650]
end

pdf.move_down 10
pdf.text "Chronologie des évènements :", :style => :bold, :indent_paragraphs => 180, :inline_format => true
hospit.hospitactes.each do |hospitacte|
pdf.move_down 20
pdf.text  "=> <u>Date/heure</u> : #{hospitacte.created_at}    <u>Observations</u> : #{hospitacte.comment}    <u>Soins</u> : #{hospitacte.soin}  <u>Intervenant</u> : Dr #{hospitacte.veterinarian.user.last_name.titleize}", :size => 9, :inline_format => true


end

pdf.move_down 100
pdf.text "Docteur #{hospit.veterinarian.user.last_name.titleize} #{hospit.veterinarian.user.first_name.titleize}", :size => 12, :indent_paragraphs => 270
pdf.text "N° d'ordre : #{hospit.veterinarian.pwz}", :size => 12, :indent_paragraphs => 280

pdf.draw_text "ZI de la Croix Blanche - 87 200 SAINT JUNIEN", :size => 12, :at => [150, 12]
pdf.draw_text "Tél : 05 55 02 17 52 - Fax : 05 55 02 68 28 - Courriel : clinvet-stjunien@wanadoo.fr", :size => 12, :at => [60, 0]
