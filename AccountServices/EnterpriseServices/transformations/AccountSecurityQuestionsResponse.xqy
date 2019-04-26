xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getAccountSecurityQuestionResponse1" element="ns4:getAccountSecurityQuestionResponse" location="../../DataServices/xsd/AccountDataServices.xsd" ::)
(:: pragma bea:global-element-return element="ns3:getAccountSecurityQuestionResponse" location="../xsd/AccountServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/RuntimeFault";
declare namespace ns1 = "http://www.tracfone.com/AccountCommonTypes";
declare namespace ns4 = "http://www.tracfone.com/AccountDataServices";
declare namespace ns3 = "http://b2b.tracfone.com/AccountServices";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/AccountSecurityQuestionsResponse/";

declare function xf:AccountSecurityQuestionsResponse($getAccountSecurityQuestionResponse1 as element(ns4:getAccountSecurityQuestionResponse))
    as element(ns3:getAccountSecurityQuestionResponse) {
        <ns3:getAccountSecurityQuestionResponse>
            <ns0:requestToken>
                <ns0:clientTransactionId>{ data($getAccountSecurityQuestionResponse1/ns0:requestToken/ns0:clientTransactionId) }</ns0:clientTransactionId>
                <ns0:clientId>{ data($getAccountSecurityQuestionResponse1/ns0:requestToken/ns0:clientId) }</ns0:clientId>
            </ns0:requestToken>
            <ns0:result>
                <ns0:code>{ data($getAccountSecurityQuestionResponse1/ns0:result/ns0:code) }</ns0:code>
                <ns0:message>{ data($getAccountSecurityQuestionResponse1/ns0:result/ns0:message) }</ns0:message>
            </ns0:result>
            <ns0:serverTransactionId>{ fn-bea:uuid() }</ns0:serverTransactionId>
            {
                for $securityQuestion in $getAccountSecurityQuestionResponse1/ns4:securityQuestion
                return
                    <ns3:securityQuestion>
                        <ns1:id>{ data($securityQuestion/ns1:id) }</ns1:id>
                        <ns1:text>{ data($securityQuestion/ns1:text) }</ns1:text>
                    </ns3:securityQuestion>
            }
        </ns3:getAccountSecurityQuestionResponse>
};

declare variable $getAccountSecurityQuestionResponse1 as element(ns4:getAccountSecurityQuestionResponse) external;

xf:AccountSecurityQuestionsResponse($getAccountSecurityQuestionResponse1)