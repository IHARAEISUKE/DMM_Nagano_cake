Admin.create!(
    email: 'admin@admin.com',
    password: 'test_admin',
)

Customer.create!(

    {
      email: 'admin1@test.com',
      last_name: '太郎',
      first_name: 'テスト',
      last_name_kana: 'タロウ',
      first_name_kana: 'テスト',
      password: 'admin1',
      postal_code: '6610014',
      address: '兵庫県A市K町11-1',
      telephone_number: '0000000000',
      is_active: 'TRUE',
    })
    Customer.create!({
       email: 'admin2@test.com',
      last_name: 'ハナコ',
      first_name: 'テスト',
      last_name_kana: 'ハナコ',
      first_name_kana: 'テスト',
      password: 'admin2',
      postal_code: '6610013',
      address: '兵庫県A市K町11-2',
      telephone_number: '0000000001',
      is_active: 'false',
    }

)

    #OrderHistory.create!({
    #   customer_id: '1',
    #   shipping_name: 'テストハナコ',
    #   shipping_postal_code: '6610013',
    #   shipping_address: '兵庫県A市K町11-2',
    #   postage: '800',
    #   payment: '1100',
    # })