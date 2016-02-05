pdf.bounding_box([0, 780], :width => 70, :height => 70) do
pdf.image "#{Rails.root}/app/assets/images/logo.png", height: 70
end
pdf.draw_text "CLINIQUE VÉTÉRINAIRE DE SAINT JUNIEN", :style => :bold, :size => 20, :at => [100, 750]
pdf.draw_text "Médecine, Imagerie, Chirurgie", :style => :bold, :size => 15, :at => [200, 730]
pdf.draw_text "Urgence assurée 24/24", :size => 12, :at => [230, 710]

pdf.draw_text " Historique médical (hors hospit) du #{animal.try(:species).try(:name)} #{animal.name.titleize} de #{proprio.last_name.titleize} #{proprio.first_name.titleize}", :style => :bold, :size => 12, :at => [150, 680]
pdf.move_down 80
@medical_records.each do |medical_record|

pdf.text "=> <u>Date</u> : #{medical_record.created_at.to_date},  <u>Vétérinaire</u> : #{medical_record.veterinarian.user.last_name}, <u>Poids</u> : #{medical_record.poids} Kg , <u>Commentaires</u> :  #{medical_record.decorate.consultation}", :size => 9, :inline_format => true
pdf.text "<u>Médicaments prescrits</u> :", :size => 9, :inline_format => true
medical_record.medicines.each do |medicine|
pdf.text "#{medicine.name.titleize} #{medicine.decorate.name_with_medoc}", :size => 9, :inline_format => true
end
pdf.move_down 10
end


pdf.draw_text "ZI de la Croix Blanche - 87 200 SAINT JUNIEN", :size => 12, :at => [150, 12]
pdf.draw_text "Tél : 05 55 02 17 52 - Fax : 05 55 02 68 28 - Courriel : clinvet-stjunien@wanadoo.fr", :size => 12, :at => [60, 0]
