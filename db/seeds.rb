User.find_or_create_by(email: 'dev@test.com') { |u| u.password = 'Dev@123' }

require 'csv'

csv_file_path = Rails.root.join('db', 'seeds', 'souko_zaiko.csv')

CSV.foreach(csv_file_path, headers: true) do |row|
  SoukoZaiko.find_or_create_by!(
    warehouse_code: row['warehouse_code'],
    sku_code: row['sku_code'],
    stock_type: row['stock_type'],
    stock: row['stock']
  )
end

csv_file_path = Rails.root.join('db', 'seeds', 'prefecture_code.csv')

CSV.foreach(csv_file_path, headers: true) do |row|
  PrefectureCode.find_or_create_by!(
    code: row['code'],
    name: row['name'],
    ew_flag: row['ew_flag']
  )
end
