class Order < ApplicationRecord
  enum payment:{
    credit: 1,
    bank: 2,
  }
end
