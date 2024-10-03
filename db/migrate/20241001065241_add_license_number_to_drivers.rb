class AddLicenseNumberToDrivers < ActiveRecord::Migration[7.2]
  def change
    add_column :drivers, :license_number, :string
  end
end
