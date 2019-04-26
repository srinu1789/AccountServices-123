xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$createAccountRequest1" element="ns3:createAccountRequest" location="../xsd/AccountServices.xsd" ::)
(:: pragma bea:global-element-return element="ns2:createAccountRequest" location="../../CoreServices/xsd/AccountCoreServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns1 = "http://www.tracfone.com/AccountCommonTypes";
declare namespace ns3 = "http://b2b.tracfone.com/AccountServices";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/createAccountRequest/";

declare function xf:createAccountRequest($createAccountRequest1 as element(ns3:createAccountRequest))
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
            <ns2:customerName>
                <ns0:firstName>{ data($createAccountRequest1/ns3:customerName/ns0:firstName) }</ns0:firstName>
                <ns0:lastName>{ data($createAccountRequest1/ns3:customerName/ns0:lastName) }</ns0:lastName>
            </ns2:customerName>
            <ns2:accountCredentials>
                <ns1:email>{ data($createAccountRequest1/ns3:accountCredentials/ns1:email) }</ns1:email>
                <ns1:password>{ data($createAccountRequest1/ns3:accountCredentials/ns1:password) }</ns1:password>
                <ns1:brandName>{ data($createAccountRequest1/ns3:accountCredentials/ns1:brandName) }</ns1:brandName>
            </ns2:accountCredentials>
            <ns2:address>
                <ns0:streetAddress>
                    <ns0:line1>{ data($createAccountRequest1/ns3:address/ns0:streetAddress/ns0:line1) }</ns0:line1>
                    {
                        for $line2 in $createAccountRequest1/ns3:address/ns0:streetAddress/ns0:line2
                        return
                            <ns0:line2>{ data($line2) }</ns0:line2>
                    }
                </ns0:streetAddress>
                <ns0:city>{ data($createAccountRequest1/ns3:address/ns0:city) }</ns0:city>
                <ns0:state>{ data($createAccountRequest1/ns3:address/ns0:state) }</ns0:state>
                <ns0:zipcode>{ data($createAccountRequest1/ns3:address/ns0:zipcode) }</ns0:zipcode>
            </ns2:address>
            {
                for $phoneNumber in $createAccountRequest1/ns3:phoneNumber
                return
                    <ns2:phoneNumber>{ data($phoneNumber) }</ns2:phoneNumber>
            }
            {
                for $dateOfBirth in $createAccountRequest1/ns3:dateOfBirth
                return
                    <ns2:dateOfBirth>{ data($dateOfBirth) }</ns2:dateOfBirth>
            }
            <ns2:securityQuestion>{ data($createAccountRequest1/ns3:securityQuestion) }</ns2:securityQuestion>
            <ns2:securityQuestionAnswer>{ data($createAccountRequest1/ns3:securityQuestionAnswer) }</ns2:securityQuestionAnswer>
            <ns2:canTracfoneContactYou>{ data($createAccountRequest1/ns3:canTracfoneContactYou) }</ns2:canTracfoneContactYou>
            <ns2:canTracfonePartnersContactYou>{ data($createAccountRequest1/ns3:canTracfonePartnersContactYou) }</ns2:canTracfonePartnersContactYou>
            <ns2:esn>{ data($createAccountRequest1/ns3:esn) }</ns2:esn>
        </ns2:createAccountRequest>
};

declare variable $createAccountRequest1 as element(ns3:createAccountRequest) external;

xf:createAccountRequest($createAccountRequest1)