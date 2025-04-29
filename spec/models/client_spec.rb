require 'rails_helper'

RSpec.describe Client, type: :model do
  describe 'クライアントモデルのバリデーション' do
    context '保存できる場合' do
      it 'すべての項目が正しく入力されていれば保存できる' do
        client = Client.new(
          name: '佐藤花子',
          address: '東京都新宿区1-2-3',
          insurance: ['介護保険', '医療保険']
        )
        expect(client).to be_valid
      end
    end

    context '保存できない場合' do
      it '名前が空だと保存できない' do
        client = Client.new(
          name: '',
          address: '東京都新宿区1-2-3',
          insurance: ['介護保険']
        )
        expect(client).to be_invalid
        expect(client.errors[:name]).to include('を入力してください')
      end

      it '住所が空だと保存できない' do
        client = Client.new(
          name: '佐藤花子',
          address: '',
          insurance: ['介護保険']
        )
        expect(client).to be_invalid
        expect(client.errors[:address]).to include('を入力してください')
      end

      it '保険種別が空だと保存できない' do
        client = Client.new(
          name: '佐藤花子',
          address: '東京都新宿区1-2-3',
          insurance: []
        )
        expect(client).to be_invalid
        expect(client.errors[:insurance]).to include('を選択してください')
      end

      it '保険種別が空白だけだと保存できない' do
        client = Client.new(
          name: '佐藤花子',
          address: '東京都新宿区1-2-3',
          insurance: ['']
        )
        expect(client).to be_invalid
        expect(client.errors[:insurance]).to include('を選択してください')
      end
    end
  end
end
