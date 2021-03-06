class Category < ActiveRecord::Base
  has_ltree_hierarchy
  has_many :plaid_categories
  has_many :transactions
  has_many :budgets
  validates :name, uniqueness: true

  def self.create_categories
    # top level categories
    income = Category.create!(name: "Income", default: true)
    expenses = Category.create!(name: "Expenses", default: true)
    special = Category.create!(name: "Special", default: true)

    #level two categories
    discretionary = Category.create!(name: "Discretionary", parent: expenses, default: true)
    recurring = Category.create!(name: "Fixed & Recurring", parent: expenses, default: true)
    life = Category.create!(name: "Life", parent: expenses, default: true)
    other = Category.create!(name: "Other Expenses", parent: expenses, default: true)
    specialexp = Category.create!(name: "Special Expenses", parent: expenses, default: true)
    variable = Category.create!(name: "Variable", parent: expenses, default: true)

    #income categories
    Category.create!(name: "Bonus", parent: income, default: true)
    Category.create!(name: "Interest Income", parent: income, default: true)
    Category.create!(name: "Other Income", parent: income, default: true)
    Category.create!(name: "Reimbursements", parent: income, default: true)
    Category.create!(name: "Salary", parent: income, default: true)

    #special
    Category.create!(name: "Benefits", parent: special, default: true)
    Category.create!(name: "Loan", parent: special, default: true)
    Category.create!(name: "Taxes", parent: special, default: true)
    Category.create!(name: "Transfer", parent: special, default: true)


    #discretionary level three
    Category.create!(name: "Home", parent: discretionary, default: true)
    Category.create!(name: "Shopping", parent: discretionary, default: true)
    Category.create!(name: "Entertainment", parent: discretionary, default: true)
    Category.create!(name: "Rental & Taxi", parent: discretionary, default: true)
    Category.create!(name: "Cash", parent: discretionary, default: true)
    Category.create!(name: "Other", parent: discretionary, default: true)

    #fixed & recurring level three
    Category.create!(name: "Cell Phone", parent: recurring, default: true)
    Category.create!(name: "Insurance", parent: recurring, default: true)
    Category.create!(name: "Rent & Mortgage", parent: recurring, default: true)
    Category.create!(name: "Transportation", parent: recurring, default: true)
    Category.create!(name: "TV & Internet", parent: recurring, default: true)
    Category.create!(name: "Utilities", parent: recurring, default: true)

    #life level three categories
    Category.create!(name: "Charity & Community", parent: life, default: true)
    Category.create!(name: "Gifts", parent: life, default: true)
    Category.create!(name: "Trips", parent: life, default: true)
    Category.create!(name: "Wedding", parent: life, default: true)

    #other level three categories
    Category.create!(name: "Adjustments", parent: other, default: true)
    Category.create!(name: "Reimbursable Expenses", parent: other, default: true)
    Category.create!(name: "Interest & Fees", parent: other, default: true)

    # #special & untagged
    Category.create!(name: "Tag", parent: specialexp, default: true)

    #variable level three
    Category.create!(name: "Cars & Vehicles", parent: variable, default: true)
    Category.create!(name: "Children", parent: variable, default: true)
    Category.create!(name: "Cleaning Supplies & Maids", parent: variable, default: true)
    Category.create!(name: "Education", parent: variable, default: true)
    Category.create!(name: "Fitness & Recreation", parent: variable, default: true)
    Category.create!(name: "Healthcare", parent: variable, default: true)
    Category.create!(name: "Laundry", parent: variable, default: true)
    Category.create!(name: "Personal Care", parent: variable, default: true)
    Category.create!(name: "Pets", parent: variable, default: true)

    #food
    food = Category.create!(name: "Total Food", parent: variable, default: true)
    Category.create!(name: "Alcohol & Bars", parent: food, default: true)
    Category.create!(name: "Coffee Shops", parent: food, default: true)
    Category.create!(name: "Fast Food & Delivery", parent: food, default: true)
    Category.create!(name: "Groceries", parent: food, default: true)
    Category.create!(name: "Other Food", parent: food, default: true)
    Category.create!(name: "Restaurants", parent: food, default: true)
    Category.create!(name: "Work Meals", parent: food, default: true)
  end
end
