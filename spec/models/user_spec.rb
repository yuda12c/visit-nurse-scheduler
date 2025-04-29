require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションのテスト' do
    context '正常系' do
      it 'すべての項目が正しく入力されていれば保存できる' do
        user = User.new(
          name: '田中太郎',
          email: 'tanaka@example.com',
          workdays: '月火水',
          worktime: '9:00-18:00',
          eligibility: '看護師'
        )
        expect(user).to be_valid
      end
    end

    context '異常系' do
      it '名前が空だと保存できない' do
        user = User.new(
          name: '',
          email: 'tanaka@example.com',
          workdays: '月火水',
          worktime: '9:00-18:00',
          eligibility: '看護師'
        )
        expect(user).to be_invalid
        expect(user.errors[:name]).to include("を入力してください")
      end

      it 'メールアドレスが空だと保存できない' do
        user = User.new(
          name: '田中太郎',
          email: '',
          workdays: '月火水',
          worktime: '9:00-18:00',
          eligibility: '看護師'
        )
        expect(user).to be_invalid
        expect(user.errors[:email]).to include("を入力してください")
      end

      it 'メールアドレスが重複していると保存できない' do
        User.create!(
          name: '田中太郎',
          email: 'tanaka@example.com',
          workdays: '月火水',
          worktime: '9:00-18:00',
          eligibility: '看護師'
        )
        user = User.new(
          name: '山田花子',
          email: 'tanaka@example.com', # 同じメールアドレス
          workdays: '木金土',
          worktime: '10:00-19:00',
          eligibility: '作業療法士'
        )
        expect(user).to be_invalid
        expect(user.errors[:email]).to include("はすでに存在します")
      end

      it '勤務曜日が空だと保存できない' do
        user = User.new(
          name: '田中太郎',
          email: 'tanaka@example.com',
          workdays: '',
          worktime: '9:00-18:00',
          eligibility: '看護師'
        )
        expect(user).to be_invalid
        expect(user.errors[:workdays]).to include("を入力してください")
      end

      it '勤務時間が空だと保存できない' do
        user = User.new(
          name: '田中太郎',
          email: 'tanaka@example.com',
          workdays: '月火水',
          worktime: '',
          eligibility: '看護師'
        )
        expect(user).to be_invalid
        expect(user.errors[:worktime]).to include("を入力してください")
      end

      it '資格が空だと保存できない' do
        user = User.new(
          name: '田中太郎',
          email: 'tanaka@example.com',
          workdays: '月火水',
          worktime: '9:00-18:00',
          eligibility: ''
        )
        expect(user).to be_invalid
        expect(user.errors[:eligibility]).to include("を入力してください")
      end
    end
  end
end
