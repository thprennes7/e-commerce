class UserMailer < ApplicationMailer
  default from: 'no-reply@e-commerce.fr'

  def welcome_email(user)
    @user = user

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://prod-ecommerce-thprennes.herokuapp.com'

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def order_email(user, item)
    @item = item
    @user = user
    mail(to: @user.email, subject: 'Nouvel achat')
  end

  def order_user_email(user, item)
    @item  = item
    @user = user
    mail(to: @user.email, subject: 'Votre commande e-commerce')
  end
end
