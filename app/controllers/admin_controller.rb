class AdminController < ApplicationController
  def role_create
    @role=Role.new(params[:role])
    if request.post?
      if @role.save
        flash[:notice] = "Role saved Successfully"
        redirect_to :controller =>"admin",:action => "role_create"
      else
        flash[:notice] = "Error in saving"
        redirect_to :controller =>"admin",:action => "role_create"
      end
    end
  end

  def user_create
    @role=Role.find(:all)
    @admin=Admin.new(params[:admin])
    if request.post?
      if @admin.save
       @adm=Admin.all
       @a=File.open("#{Rails.root}/public/users/#{@admin.name}.rb","a+");
        @a.puts " Name          Email "
        @adm.each do |a|
          @a.puts "#{a.name}   #{a.email}" 
        end
        @a.close
      # if @admin.save
#        
        # flash[:notice] = "User saved Successfully"
        # redirect_to :controller =>"admin",:action => "display_users",
        render 'display_users'
      # else
        # flash[:notice] = "Error in saving"
        # redirect_to :controller =>"admin",:action => "user_create"
       end
    end
  end

  def signin
    if request.post?
      name=params[:signin][:name]
      password=params[:signin][:password]
      @user=Admin.find_by_name_and_password(name,password)
      if @user and Admin.authenticate?(@user.name)
        session[:user_id] = @user.id
        role=Role.find(@user.role_id).name
        if role == "Seller"
          flash[:notice] = "Welcome, #{@user.name}!"
          redirect_to :controller => 'products', :action => 'index'
        elsif role == "Buyer"
          flash[:notice] = "Welcome, #{@user.name}!"
          redirect_to :controller => 'buyer', :action => 'catalog'
        elsif role == "Admin"
          redirect_to :controller=> 'admin',:action => 'user_create',:name=>@user.name
        end
      else
        flash[:notice] = 'Invalid username or password combination'
      end
    end
  end

  def logout
    session[:user_id]=nil
    flash[:notice]="Successfully logged out."
    redirect_to :controller => "admin",:action => "signin"
  end
  
  def omniauth_failure
    redirect_to admin_logout_path#init_sign_in_users_path
    #redirect wherever you want.
  end


end
