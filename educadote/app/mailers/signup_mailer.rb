class SignupMailer < ActionMailer::Base

    default :from => 'jhcapucho@gmail.com'

    def confirm_email(user)
        @user = user
        @confirmation_link = confirmation_url({
            :token => @user.confirmation_token
        })

        mail({

            :to => user.email,
            :bcc => ['sign ups <signups@educadote.com>'],
            :subject => I18n.t('signup_mailer.confirm_email.subject')

        })

    end
end
