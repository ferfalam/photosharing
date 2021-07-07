class PostMailer < ApplicationMailer
    def post_mail(post)
        @post = post
        mail to: post.user.email, subject: "Post confirmation email"
    end
    
end
