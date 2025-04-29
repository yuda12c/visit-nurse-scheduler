require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe 'スケジュールモデルのバリデーション' do
    let(:user) { User.create(name: '田中太郎', email: 'tanaka@example.com', workdays: '月火水', worktime: '9:00-18:00', eligibility: '看護師') }
    let(:client) { Client.create(name: '佐藤花子', address: '東京都新宿区1-2-3', insurance: ['介護保険']) }

    context '保存できる場合' do
      it 'すべての項目が正しく入力されていれば保存できる' do
        schedule = Schedule.new(
          user: user,
          client: client,
          weekday: '月',
          start_time: '10:00',
          end_time: '11:00'
        )
        expect(schedule).to be_valid
      end
    end

    context '保存できない場合' do
      it 'user_idが空だと保存できない' do
        schedule = Schedule.new(
          user: nil,
          client: client,
          weekday: '月',
          start_time: '10:00',
          end_time: '11:00'
        )
        expect(schedule).to be_invalid
        expect(schedule.errors[:user]).to include('を入力してください')
      end

      it 'client_idが空だと保存できない' do
        schedule = Schedule.new(
          user: user,
          client: nil,
          weekday: '月',
          start_time: '10:00',
          end_time: '11:00'
        )
        expect(schedule).to be_invalid
        expect(schedule.errors[:client]).to include('を入力してください')
      end

      it '曜日が空だと保存できない' do
        schedule = Schedule.new(
          user: user,
          client: client,
          weekday: '',
          start_time: '10:00',
          end_time: '11:00'
        )
        expect(schedule).to be_invalid
        expect(schedule.errors[:weekday]).to include('を入力してください')
      end

      it '開始時刻が空だと保存できない' do
        schedule = Schedule.new(
          user: user,
          client: client,
          weekday: '月',
          start_time: nil,
          end_time: '11:00'
        )
        expect(schedule).to be_invalid
        expect(schedule.errors[:start_time]).to include('を入力してください')
      end

      it '終了時刻が空だと保存できない' do
        schedule = Schedule.new(
          user: user,
          client: client,
          weekday: '月',
          start_time: '10:00',
          end_time: nil
        )
        expect(schedule).to be_invalid
        expect(schedule.errors[:end_time]).to include('を入力してください')
      end
    end
  end
end
