module WishlistsHelper
  def fix_price(price)
    return price.to_f / 100
  end
end
