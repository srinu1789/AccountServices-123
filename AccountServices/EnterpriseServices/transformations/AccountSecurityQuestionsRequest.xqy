xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getAccountSecurityQuestionsRequest1" element="ns1:getAccountSecurityQuestionsRequest" location="../xsd/AccountServices.xsd" ::)
(:: pragma bea:global-element-return element="ns2:getAccountSecurityQuestionsRequest" location="../../DataServices/xsd/AccountDataServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/AccountDataServices";
declare namespace ns1 = "http://b2b.tracfone.com/AccountServices";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/SecurityQuestions/";

declare function xf:SecurityQuestions($getAccountSecurityQuestionsRequest1 as element(ns1:getAccountSecurityQuestionsRequest))
    as element(ns2:getAccountSecurityQuestionsRequest) {
        <ns2:getAccountSecurityQuestionsRequest>
            <ns0:requestToken>
                <ns0:clientTransactionId>{ data($getAccountSecurityQuestionsRequest1/ns0:requestToken/ns0:clientTransactionId) }</ns0:clientTransactionId>
                <ns0:clientId>{ data($getAccountSecurityQuestionsRequest1/ns0:requestToken/ns0:clientId) }</ns0:clientId>
            </ns0:requestToken>
            <ns0:brandName>{ data($getAccountSecurityQuestionsRequest1/ns0:brandName) }</ns0:brandName>
            <ns0:sourceSystem>{ data($getAccountSecurityQuestionsRequest1/ns0:sourceSystem) }</ns0:sourceSystem>
            {
                for $language in $getAccountSecurityQuestionsRequest1/ns0:language
                return
                    <ns0:language>{ data($language) }</ns0:language>
            }
        </ns2:getAccountSecurityQuestionsRequest>
};

declare variable $getAccountSecurityQuestionsRequest1 as element(ns1:getAccountSecurityQuestionsRequest) external;

xf:SecurityQuestions($getAccountSecurityQuestionsRequest1)