xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$forgotPasswordResponse1" element="ns2:forgotPasswordResponse" location="../xsd/AccountServices.xsd" ::)
(:: pragma bea:global-element-return element="ns2:forgotPasswordResponse" location="../xsd/AccountServices.xsd" ::)

declare namespace ns2 = "http://b2b.tracfone.com/AccountServices";
declare namespace ns1 = "http://www.tracfone.com/RuntimeFault";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/ForgotPasswordResponse/";

declare function xf:ForgotPasswordResponse($forgotPasswordResponse1 as element(ns2:forgotPasswordResponse))
    as element(ns2:forgotPasswordResponse) {
        <ns2:forgotPasswordResponse>
            <ns0:requestToken>{ $forgotPasswordResponse1/ns0:requestToken/@* , $forgotPasswordResponse1/ns0:requestToken/node() }</ns0:requestToken>
            <ns0:result>{ $forgotPasswordResponse1/ns0:result/@* , $forgotPasswordResponse1/ns0:result/node() }</ns0:result>
            {
                for $RuntimeFaultMessage in $forgotPasswordResponse1/ns1:RuntimeFaultMessage
                return
                    <ns1:RuntimeFaultMessage>{ $RuntimeFaultMessage/@* , $RuntimeFaultMessage/node() }</ns1:RuntimeFaultMessage>
            }
        </ns2:forgotPasswordResponse>
};

declare variable $forgotPasswordResponse1 as element(ns2:forgotPasswordResponse) external;

xf:ForgotPasswordResponse($forgotPasswordResponse1)