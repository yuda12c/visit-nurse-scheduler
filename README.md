# README

## users
Column	           | Type	  | Options
------------------------------------------
name	             | string	| null: false
email	             | string	| null: false, unique: true
encrypted_password | string	| null: false
worktime           | string | null: false
eligibility        | string | null: false

  has_many :schedules  
  has_many :clients, through: :schedules

## clients
Column	           | Type	  | Options
------------------------------------------
name               | string	| null: false
address	           | string	| null: false
insurance        	 | string	| null: false
addition           | string |
memo               | string |

has_many :schedules  
has_many :users, through: :schedules

## schedules
user               | references	| null: false, foreign_key: true
client             | references	| null: false, foreign_key: true
weekday            | string	| null: false
timeslot           | string	| null: false
duration           | string	| null: false
memo               | string	| 

belongs_to :user  
belongs_to :client