ActiveRecord::Schema.define do
  self.verbose = false

  create_table :projects, :force => true do |t|
    t.string :name
    t.integer :status
    t.timestamps
  end
end