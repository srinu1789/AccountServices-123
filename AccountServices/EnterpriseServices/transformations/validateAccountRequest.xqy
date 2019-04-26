xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$validateAccountRequest1" element="ns5:validateAccountRequest" location="../xsd/AccountServices.xsd" ::)
(:: pragma bea:global-element-return element="ns4:validateAccountRequest" location="../xsd/AuthenticationBPEL.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/AccountCommonTypes";
declare namespace ns1 = "http://www.tracfone.com/CommonTypes";
declare namespace ns4 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns3 = "http://www.tracfone.com/SecurityCommonTypes";
declare namespace ns0 = "http://www.tracfone.com/PhoneCommonTypes";
declare namespace ns5 = "http://b2b.tracfone.com/AccountServices";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/validateAccountRequest/";

declare function xf:validateAccountRequest($validateAccountRequest1 as element(ns5:validateAccountRequest))
    as element(ns4:validateAccountRequest) {
        <ns4:validateAccountRequest>
            <ns1:requestToken>
                <ns1:clientTransactionId>{ data($validateAccountRequest1/ns1:requestToken/ns1:clientTransactionId) }</ns1:clientTransactionId>
                <ns1:clientId>{ data($validateAccountRequest1/ns1:requestToken/ns1:clientId) }</ns1:clientId>
            </ns1:requestToken>
            <ns1:brandName>{ data($validateAccountRequest1/ns1:brandName) }</ns1:brandName>
            <ns1:sourceSystem>{ data($validateAccountRequest1/ns1:sourceSystem) }</ns1:sourceSystem>
            {
                for $language in $validateAccountRequest1/ns1:language
                return
                    <ns1:language>{ data($language) }</ns1:language>
            }
            <ns4:accountCredentials>
                <ns3:AccountCredentials>
                    <ns2:email>{ data($validateAccountRequest1/ns5:authenticationCredentials/ns3:AccountCredentials/ns2:email) }</ns2:email>
                    <ns2:password>{ data($validateAccountRequest1/ns5:authenticationCredentials/ns3:AccountCredentials/ns2:password) }</ns2:password>
                </ns3:AccountCredentials>
                <ns3:DeviceCredentials loggable = "{ data($validateAccountRequest1/ns5:authenticationCredentials/ns3:DeviceCredentials/@loggable) }">
                    <ns0:deviceId>
                        {
                            for $min in $validateAccountRequest1/ns5:authenticationCredentials/ns3:DeviceCredentials/ns0:deviceId/ns0:min
                            return
                                <ns0:min>{ data($min) }</ns0:min>
                        }
                        {
                            for $esn in $validateAccountRequest1/ns5:authenticationCredentials/ns3:DeviceCredentials/ns0:deviceId/ns0:esn
                            return
                                <ns0:esn>{ data($esn) }</ns0:esn>
                        }
                    </ns0:deviceId>
                    <ns0:securityPin>{ data($validateAccountRequest1/ns5:authenticationCredentials/ns3:DeviceCredentials/ns0:securityPin) }</ns0:securityPin>
                </ns3:DeviceCredentials>
                <ns3:csrAccountCredentials>
                    <ns2:login>{ data($validateAccountRequest1/ns5:authenticationCredentials/ns3:csrAccountCredentials/ns2:login) }</ns2:login>
                    <ns2:password>{ data($validateAccountRequest1/ns5:authenticationCredentials/ns3:csrAccountCredentials/ns2:password) }</ns2:password>
                    <ns2:customer>{ data($validateAccountRequest1/ns5:authenticationCredentials/ns3:csrAccountCredentials/ns2:customer) }</ns2:customer>
                </ns3:csrAccountCredentials>
                <ns3:accountTokenCredentials>
                    <ns2:token>{ data($validateAccountRequest1/ns5:authenticationCredentials/ns3:accountTokenCredentials/ns2:token) }</ns2:token>
                    <ns2:account>
                        <ns2:accountIdentifierName>{ data($validateAccountRequest1/ns5:authenticationCredentials/ns3:accountTokenCredentials/ns2:account/ns2:accountIdentifierName) }</ns2:accountIdentifierName>
                        <ns2:accountIdentifierValue>{ data($validateAccountRequest1/ns5:authenticationCredentials/ns3:accountTokenCredentials/ns2:account/ns2:accountIdentifierValue) }</ns2:accountIdentifierValue>
                    </ns2:account>
                </ns3:accountTokenCredentials>
            </ns4:accountCredentials>
        </ns4:validateAccountRequest>
};

declare variable $validateAccountRequest1 as element(ns5:validateAccountRequest) external;

xf:validateAccountRequest($validateAccountRequest1)