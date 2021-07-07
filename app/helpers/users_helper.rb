module UsersHelper

    def default_or_image(user) 
        if user.image.identifier== "default.png" || @user.image.identifier  == nil
            "/uploads/default.png"
        else 
            user.image.url
        end
        
    end
    
end
