xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://b2b.tracfone.com/AccountServices";
(:: import schema at "../xsd/AccountServices.xsd" ::)
declare namespace ns1="http://www.tracfone.com/AccountSpringFarmServices";
(:: import schema at "../../SpringFarmServices/xsd/AccountSpringFarmServices.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare variable $IsValidAccountRequest as element() (:: schema-element(ns1:accountRecoveryAccountStatusResponse) ::) external;

declare function local:IsValidAccount($IsValidAccountRequest as element() (:: schema-element(ns1:accountRecoveryAccountStatusResponse) ::)) as element() (:: schema-element(ns2:isValidAccountResponse) ::) {
    <ns2:isValidAccountResponse>
        <com:requestToken>
            <com:clientTransactionId>{fn:data($IsValidAccountRequest/com:requestToken/com:clientTransactionId)}</com:clientTransactionId>
            <com:clientId>{fn:data($IsValidAccountRequest/com:requestToken/com:clientId)}</com:clientId>
        </com:requestToken>
		 <com:result>
                <com:code>{ fn:data($IsValidAccountRequest/com:result/com:code) }</com:code>
                <com:message>{ fn:data($IsValidAccountRequest/com:result/com:message) }</com:message>
            </com:result>
            <com:serverTransactionId>{ fn:data($IsValidAccountRequest/com:serverTransactionId) }</com:serverTransactionId>
        <ns2:accountStatus>{fn:data($IsValidAccountRequest/ns1:accountStatus)}</ns2:accountStatus>
        {
            if ($IsValidAccountRequest/ns1:securityPin)
            then <ns2:securityPin>{fn:data($IsValidAccountRequest/ns1:securityPin)}</ns2:securityPin>
            else ()
        }
        {
            if ($IsValidAccountRequest/ns1:securityQuestionAvail)
            then <ns2:securityQuestionAvail>{fn:data($IsValidAccountRequest/ns1:securityQuestionAvail)}</ns2:securityQuestionAvail>
            else ()
        }
        {
            if ($IsValidAccountRequest/ns1:securityQuestion)
            then <ns2:securityQuestion>{fn:data($IsValidAccountRequest/ns1:securityQuestion)}</ns2:securityQuestion>
            else ()
        }
    </ns2:isValidAccountResponse>
};

local:IsValidAccount($IsValidAccountRequest)
