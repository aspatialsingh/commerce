class CreateCompanyInfos < ActiveRecord::Migration
  def change
    create_table :company_infos do |t|
      t.string :comp_name
      t.srting :comp_location
      t.int :contect_number

      t.timestamps
    end
  end
end
