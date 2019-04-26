xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$createAccountRequest1" element="ns2:createAccountRequest" location="../xsd/AccountServices.xsd" ::)
(:: pragma bea:global-element-return element="ns2:createAccountRequest" location="../xsd/AccountCreation_BPEL.xsd" ::)

declare namespace ns2 = "http://b2b.tracfone.com/AccountServices";
declare namespace ns1 = "http://www.tracfone.com/AccountCommonTypes";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/AccountCreationRequest/";

declare function xf:AccountCreationRequest($createAccountRequest1 as element(ns2:createAccountRequest))
    as element(ns2:createAccountRequest) {
        <ns2:createAccountRequest>
            <ns0:requestToken>
                <ns0:clientTransactionId>{ data($createAccountRequest1/ns0:requestToken/ns0:clientTransactionId) }</ns0:clientTransactionId>
                <ns0:clientId>{ data($createAccountRequest1/ns0:requestToken/ns0:clientId) }</ns0:clientId>
            </ns0:requestToken>
            <ns0:brandName>{ data($createAccountRequest1/ns0:brandName) }</ns0:brandName>
            <ns0:sourceSystem>{ data($createAccountRequest1/ns0:sourceSystem) }</ns0:sourceSystem>
            {
                for $language in $createAccountRequest1/ns0:language
                return
                    <ns0:language>{ data($language) }</ns0:language>
            }
            <ns2:customerName>{ $createAccountRequest1/ns2:customerName/@* , $createAccountRequest1/ns2:customerName/node() }</ns2:customerName>
            <ns2:accountCredentials>
                <ns1:email>{ data($createAccountRequest1/ns2:accountCredentials/ns1:email) }</ns1:email>
                { if(data($createAccountRequest1/ns2:fourPin)) then
                
                if(data($createAccountRequest1/ns2:accountCredentials/ns1:password))
                then
                
                <ns1:password>{ data($createAccountRequest1/ns2:accountCredentials/ns1:password) }</ns1:password>
                
                else
                <ns1:password>{fn:substring(fn-bea:uuid(),1,8)}</ns1:password>
                
                else
                
                <ns1:password>{ data($createAccountRequest1/ns2:accountCredentials/ns1:password) }</ns1:password>
                }
            </ns2:accountCredentials>
            <ns2:address>
                <ns0:streetAddress>
                 { if(data($createAccountRequest1/ns2:fourPin)) then
                 if(data($createAccountRequest1/ns2:address/ns0:streetAddress/ns0:line1)) then
                <ns0:line1>{ data($createAccountRequest1/ns2:address/ns0:streetAddress/ns0:line1) }</ns0:line1>
                
                else
                 <ns0:line1>{'Dummy Line1'}</ns0:line1>
                 else
                    <ns0:line1>{ data($createAccountRequest1/ns2:address/ns0:streetAddress/ns0:line1) }</ns0:line1>
                  }  
                    
                    {
                        for $line2 in $createAccountRequest1/ns2:address/ns0:streetAddress/ns0:line2
                        return
                            <ns0:line2>{ data($line2) }</ns0:line2>
                    }
                </ns0:streetAddress>
                <ns0:city>{ data($createAccountRequest1/ns2:address/ns0:city) }</ns0:city>
                <ns0:state>{ data($createAccountRequest1/ns2:address/ns0:state) }</ns0:state>
                <ns0:zipcode>{ data($createAccountRequest1/ns2:address/ns0:zipcode) }</ns0:zipcode>
            </ns2:address>
            {
                for $phoneNumber in $createAccountRequest1/ns2:phoneNumber
                return
                    <ns2:phoneNumber>{ data($phoneNumber) }</ns2:phoneNumber>
            }
            {
                for $dateOfBirth in $createAccountRequest1/ns2:dateOfBirth
                return
                    <ns2:dateOfBirth>{ data($dateOfBirth) }</ns2:dateOfBirth>
            }
            
            { if(data($createAccountRequest1/ns2:fourPin)) then
        
           <ns2:fourPin>{ data($createAccountRequest1/ns2:fourPin)}</ns2:fourPin>
                else
                    ()
            }
            <ns2:securityQuestion>{ data($createAccountRequest1/ns2:securityQuestion) }</ns2:securityQuestion>
            <ns2:securityQuestionAnswer>{ data($createAccountRequest1/ns2:securityQuestionAnswer) }</ns2:securityQuestionAnswer>
            <ns2:canTracfoneContactYou>{ data($createAccountRequest1/ns2:canTracfoneContactYou) }</ns2:canTracfoneContactYou>
            <ns2:canTracfonePartnersContactYou>{ data($createAccountRequest1/ns2:canTracfonePartnersContactYou) }</ns2:canTracfonePartnersContactYou>
            {
                for $esn in $createAccountRequest1/ns2:esn
                return
                    <ns2:esn>{ data($esn) }</ns2:esn>
            }
        </ns2:createAccountRequest>
};

declare variable $createAccountRequest1 as element(ns2:createAccountRequest) external;

xf:AccountCreationRequest($createAccountRequest1)