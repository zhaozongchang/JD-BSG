class Category < ApplicationRecord
  # 關聯 #
  belongs_to :category_group
  has_many :products
  # 新增/修改欄位限制與提示 #
  validates :name, presence: { message: "請輸入分類名稱" }
  validates :category_group_id, presence: { message: "請選擇分類類型" }
  # 發佈 / 隱藏 #
  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end
  # Scope #
  scope :published, -> { where(is_hidden: false) }

end