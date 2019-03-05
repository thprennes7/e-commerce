class UserMailer < ApplicationMailer
  default from: 'no-reply@e-commerce.fr'

  def welcome_email(user)
    @user = user

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://prod-ecommerce-thprennes.herokuapp.com'

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def order_send(user)
    @user = user
    if @user.is_admin?
      UserMailer.order_email.deliver_now
    end
  end

  def order_email(user)
    @user = user
    mail(to: @user.email, subject: 'Nouvel achat')
  end

end
