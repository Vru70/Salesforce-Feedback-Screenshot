/**
 * @author            : Vrushabh Uprikar
 * @last modified on  : 05-07-2021
 * @last modified by  : Vrushabh Uprikar
 * Modifications Log 
 * Ver   Date         Author             Modification
 * 1.0   05-07-2021   Vrushabh Uprikar   Initial Version
**/
public with sharing class sendEmailWithImage 
{
     public string strImageBlob {get;set;}

    public void sendEmail()
    {
        System.debug('Sending mail -------');
        Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
        List<String> lstString = new List<String>();
        mail.setToAddresses(new String[]{'Your Mail Address'});
        mail.setSubject('Feedback Email with Attached Image');
        Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
        attach.setContentType('image/png');
        attach.setFileName('Test.png');
        attach.setInline(false);
        attach.Body = EncodingUtil.base64Decode(strImageBlob.replaceFirst('data:image/png;base64,',''));
        mail.setHtmlBody('Please find the attached Image :');
        mail.setFileAttachments(new Messaging.EmailFileAttachment[] { attach });
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
        System.debug('Mail Send -------');
    }
}
