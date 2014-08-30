ActiveRecord::Schema.define do
  self.verbose = false

  create_table :projects, :force => true do |t|
    t.string :name
    t.integer :state
    t.timestamps
  end
end