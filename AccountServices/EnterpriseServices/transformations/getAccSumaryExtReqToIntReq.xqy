xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getAccountSummaryRequest1" element="ns4:getAccountSummaryRequest" location="../xsd/AccountServices.xsd" ::)
(:: pragma bea:global-element-return element="ns5:getAccountSummaryRequest" location="../../DataServices/xsd/AccountDataServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/AccountCommonTypes";
declare namespace ns1 = "http://www.tracfone.com/CommonTypes";
declare namespace ns4 = "http://b2b.tracfone.com/AccountServices";
declare namespace ns3 = "http://www.tracfone.com/SecurityCommonTypes";
declare namespace ns0 = "http://www.tracfone.com/PhoneCommonTypes";
declare namespace ns5 = "http://www.tracfone.com/AccountDataServices";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/getAccSumaryExtReqToIntReq/";

declare function xf:getAccSumaryExtReqToIntReq($getAccountSummaryRequest1 as element(ns4:getAccountSummaryRequest))
    as element(ns5:getAccountSummaryRequest) {
        <ns5:getAccountSummaryRequest>
            <ns1:requestToken>
                <ns1:clientTransactionId>{ data($getAccountSummaryRequest1/ns1:requestToken/ns1:clientTransactionId) }</ns1:clientTransactionId>
                <ns1:clientId>{ data($getAccountSummaryRequest1/ns1:requestToken/ns1:clientId) }</ns1:clientId>
            </ns1:requestToken>
            <ns1:brandName>{ data($getAccountSummaryRequest1/ns1:brandName) }</ns1:brandName>
            <ns1:sourceSystem>{ data($getAccountSummaryRequest1/ns1:sourceSystem) }</ns1:sourceSystem>
            {
                for $language in $getAccountSummaryRequest1/ns1:language
                return
                    <ns1:language>{ data($language) }</ns1:language>
            }
             {
            for $email in $getAccountSummaryRequest1/ns4:authenticationCredentials/ns3:AccountCredentials/ns2:email
            return
            
            <ns5:loginName>{ data($getAccountSummaryRequest1/ns4:authenticationCredentials/ns3:AccountCredentials/ns2:email) }</ns5:loginName>
            }
            {
            for $password in $getAccountSummaryRequest1/ns4:authenticationCredentials/ns3:AccountCredentials/ns2:password
            return
            <ns5:password>{ data($getAccountSummaryRequest1/ns4:authenticationCredentials/ns3:AccountCredentials/ns2:password) }</ns5:password>
            }
            <ns5:authenticationCredentials>
            {
            for $accountCredentials in $getAccountSummaryRequest1/ns4:authenticationCredentials/ns3:AccountCredentials
            return
                <ns3:AccountCredentials>
                    <ns2:email>{ data($getAccountSummaryRequest1/ns4:authenticationCredentials/ns3:AccountCredentials/ns2:email) }</ns2:email>
                    <ns2:password>{ data($getAccountSummaryRequest1/ns4:authenticationCredentials/ns3:AccountCredentials/ns2:password) }</ns2:password>
                </ns3:AccountCredentials>
                }
                 {
            for $deviceCredentials in $getAccountSummaryRequest1/ns4:authenticationCredentials/ns3:DeviceCredentials
            return
                <ns3:DeviceCredentials loggable = "{ data($getAccountSummaryRequest1/ns4:authenticationCredentials/ns3:DeviceCredentials/@loggable) }">
                    <ns0:deviceId>
                        {
                            for $min in $getAccountSummaryRequest1/ns4:authenticationCredentials/ns3:DeviceCredentials/ns0:deviceId/ns0:min
                            return
                                <ns0:min>{ data($min) }</ns0:min>
                        }
                        {
                            for $esn in $getAccountSummaryRequest1/ns4:authenticationCredentials/ns3:DeviceCredentials/ns0:deviceId/ns0:esn
                            return
                                <ns0:esn>{ data($esn) }</ns0:esn>
                        }
                    </ns0:deviceId>
                    <ns0:securityPin>{ data($getAccountSummaryRequest1/ns4:authenticationCredentials/ns3:DeviceCredentials/ns0:securityPin) }</ns0:securityPin>
                </ns3:DeviceCredentials>
                }
                    {
            for $csrAccountCredentials in $getAccountSummaryRequest1/ns4:authenticationCredentials/ns3:csrAccountCredentials
            return
                <ns3:csrAccountCredentials>
                    <ns2:login>{ data($getAccountSummaryRequest1/ns4:authenticationCredentials/ns3:csrAccountCredentials/ns2:login) }</ns2:login>
                    <ns2:password>{ data($getAccountSummaryRequest1/ns4:authenticationCredentials/ns3:csrAccountCredentials/ns2:password) }</ns2:password>
                    <ns2:customer>{ data($getAccountSummaryRequest1/ns4:authenticationCredentials/ns3:csrAccountCredentials/ns2:customer) }</ns2:customer>
                </ns3:csrAccountCredentials>
                }
                 {
            for $accountTokenCredentials in $getAccountSummaryRequest1/ns4:authenticationCredentials/ns3:accountTokenCredentials
            return
                <ns3:accountTokenCredentials>
                    <ns2:token>{ data($getAccountSummaryRequest1/ns4:authenticationCredentials/ns3:accountTokenCredentials/ns2:token) }</ns2:token>
                    <ns2:account>
                        <ns2:accountIdentifierName>{ data($getAccountSummaryRequest1/ns4:authenticationCredentials/ns3:accountTokenCredentials/ns2:account/ns2:accountIdentifierName) }</ns2:accountIdentifierName>
                        <ns2:accountIdentifierValue>{ data($getAccountSummaryRequest1/ns4:authenticationCredentials/ns3:accountTokenCredentials/ns2:account/ns2:accountIdentifierValue) }</ns2:accountIdentifierValue>
                    </ns2:account>
                </ns3:accountTokenCredentials>
                }
                 {
            for $csrAccountTokenCredentials in $getAccountSummaryRequest1/ns4:authenticationCredentials/ns3:csrAccountTokenCredentials
            return
                <ns3:csrAccountTokenCredentials>
                    <ns2:token>{ data($getAccountSummaryRequest1/ns4:authenticationCredentials/ns3:csrAccountTokenCredentials/ns2:token) }</ns2:token>
                    <ns2:csrAccount>
                        <ns2:accountIdentifierName>{ data($getAccountSummaryRequest1/ns4:authenticationCredentials/ns3:csrAccountTokenCredentials/ns2:csrAccount/ns2:accountIdentifierName) }</ns2:accountIdentifierName>
                        <ns2:accountIdentifierValue>{ data($getAccountSummaryRequest1/ns4:authenticationCredentials/ns3:csrAccountTokenCredentials/ns2:csrAccount/ns2:accountIdentifierValue) }</ns2:accountIdentifierValue>
                    </ns2:csrAccount>
                    <ns2:customer>
                        <ns2:accountIdentifierName>{ data($getAccountSummaryRequest1/ns4:authenticationCredentials/ns3:csrAccountTokenCredentials/ns2:customer/ns2:accountIdentifierName) }</ns2:accountIdentifierName>
                        <ns2:accountIdentifierValue>{ data($getAccountSummaryRequest1/ns4:authenticationCredentials/ns3:csrAccountTokenCredentials/ns2:customer/ns2:accountIdentifierValue) }</ns2:accountIdentifierValue>
                    </ns2:customer>
                </ns3:csrAccountTokenCredentials>
                }
                {
            for $deviceAccountCredentials in $getAccountSummaryRequest1/ns4:authenticationCredentials/ns3:DeviceAccountCredentials
            return
                <ns3:DeviceAccountCredentials loggable = "{ data($deviceAccountCredentials/@loggable) }">
                    {
                        for $email in $deviceAccountCredentials/ns3:email
                        return
                        <ns3:email>{ fn:data($email) }</ns3:email>
                    }
                    {
                        for $min in $deviceAccountCredentials/ns3:deviceId/ns0:min
                        return
                        <ns3:deviceId>
                            <ns0:min>{ fn:data($min) }</ns0:min>
                        </ns3:deviceId>
                    }
                    {
                        for $esn in $deviceAccountCredentials/ns3:deviceId/ns0:esn
                        return
                        <ns3:deviceId>
                            <ns0:esn>{ fn:data($esn) }</ns0:esn>
                        </ns3:deviceId>
                    }
                    {
                        for $securityPin in $deviceAccountCredentials/ns3:securityPin
                        return
                        <ns3:securityPin>{ fn:data($securityPin) }</ns3:securityPin>
                    }
                    {
                        for $password in $deviceAccountCredentials/ns3:password
                        return
                        <ns3:password>{ fn:data($password) }</ns3:password>
                    }
                    
                </ns3:DeviceAccountCredentials>
                }
            </ns5:authenticationCredentials>
            {
                for $organizationId in $getAccountSummaryRequest1/ns4:organizationId
                return
                    <ns5:organizationId>{ data($organizationId) }</ns5:organizationId>
            }
        </ns5:getAccountSummaryRequest>
};

declare variable $getAccountSummaryRequest1 as element(ns4:getAccountSummaryRequest) external;

xf:getAccSumaryExtReqToIntReq($getAccountSummaryRequest1)