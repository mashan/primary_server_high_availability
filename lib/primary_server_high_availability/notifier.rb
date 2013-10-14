module PrimaryServerHighAvailability
  class Notifier
    class Mail
      def initialize(mail_to, mail_from, subject, body)
        @mail_to = mail_to
        @mail_from = mail_from 
        @subject = subject
        @body = body
        @charset = 'utf8'
      end
  
      def send
        # TODO:not implemented
      end

      private
      def header
        <<-HEADER
        From: #{@mail_from}
        To: #{@mail_from}
        Subject: #{@subject}
        Mime-Version: 1.0
        Content-Type: text/plain; charset="#{@charset}
        Content-Transfer-Encoding: 7bit
        HEADER
      end
    end
  end
end
