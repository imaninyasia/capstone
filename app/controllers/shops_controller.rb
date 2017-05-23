class ShopsController < ApplicationController
  def index

    render 'index.html.erb'
  end

  def upload
    redirect_to '/uploads/new'
  end

  def users_shops
    user = User.find_by(id: session[:user_id])
    @user = user.username
    p "#"*20
    p params[:age_l]
    p params[:age_h]
    p params[:gender_v]
    p params[:gender_c]
    p "#"*20
    @shops = []
    ave_a = (params[:age_l].to_f + params[:age_h].to_f)/2
    p ave_a
    if params[:gender_c].to_i <= 70 && params[:gender_v]=="Male"
      p "maybe girl"
      if ave_a>0 && ave_a<= 3
      @shops << "Babies R' Us"
      @shops << "Baby Gap"
      @shops << "Little Owels"
      elsif ave_a>3 && ave_a<=10
      @shops<<"The Children's Place"
      @shops<<"Macy's - Big Girl's Clothes"
      @shops<<"Hannah Andersson"
      elsif ave_a>10 && ave_a<=14
      @shops<<"Claire's"
      @shops<<"Icicles Clothing"
      @shops<<"Hollister"
      elsif ave_a>14 && ave_a<=18
      @shops<<"Hot Topic"
      @shops<<"Forever 21"
      @shops<<"Wet Seal"
      elsif ave_a>18 && ave_a<=24
      @shops<<"American Apparel"
      @shops<<"Bebe"
      @shops<<"H&M"
      elsif ave_a>24 && ave_a<=30
      @shops<<"Aritzia"
      @shops<<"Top Shop - Women's"
      @shops<<"Banana Republic - Women's"
      elsif ave_a>30 && ave_a<=36
      @shops<<"Club Monaco"
      @shops<<"Anthropologie"
      @shops<<"All Saint's - Momen's"
      elsif ave_a>36 && ave_a<=43
      @shops<<"Ann Taylor"
      @shops<<"Lane Bryant"
      @shops<<"Nordstrom - Women's"
      elsif ave_a>43 && ave_a<=55
      elsif ave_a>55
      end
    elsif params[:gender_v]=="Male"
      p 'Man'
      if ave_a>0 && ave_a<= 3
      @shops << "Babies R' Us"
      @shops << "Baby Gap"
      @shops << "Little Owels"
      elsif ave_a>3 && ave_a<=10
      @shops<<"The Children's Place"
      @shops<<"Crazy8 - Boy's"
      @shops<<"Marks & Spencer - Boy's"
      elsif ave_a>10 && ave_a<=14
      @shops<<"Melijoe - Boy's"
      @shops<<"Hollister - Boy's"
      elsif ave_a>14 && ave_a<=18
      @shops<<"Hot Topic"
      @shops<<"Abercrombie & Fitch - Boy's"
      @shops<<"Aeropastale - Boy's"
      elsif ave_a>18 && ave_a<=24
      @shops<<"American Apparel - Men's"
      @shops<<"Joe Fresh - Men's"
      @shops<<"Uniqlo - Men's"
      elsif ave_a>24 && ave_a<=30
      @shops<<"Banana Republic - Men's"
      @shops<<"JCrew - Men's"
      @shops<<"Fubu"
      elsif ave_a>30 && ave_a<=36
      @shops<<"Scotch & Soda"
      @shops<<"APC Clothing"
      @shops<<"Ben Sherman"
      elsif ave_a>36 && ave_a<=43
      elsif ave_a>43 && ave_a<=55
      elsif ave_a>55
      end

    elsif params[:gender_v]=="Female"
      p "girl"

    end
    render 'shops.html.erb'
  end
end
