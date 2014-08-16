ThinkingSphinx::Index.define :post, :with => :active_record do
  indexes title
  indexes content

  has created_at, updated_at
end
