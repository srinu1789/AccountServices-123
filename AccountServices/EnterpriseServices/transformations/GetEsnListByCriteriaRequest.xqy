xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getEsnListByCriteriaRequest1" element="ns4:getEsnListByCriteriaRequest" location="../xsd/AccountServices.xsd" ::)
(:: pragma bea:global-element-return element="ns5:getEsnListByCriteriaRequest" location="../../DataServices/xsd/AccountDataServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/AccountCommonTypes";
declare namespace ns1 = "http://www.tracfone.com/CommonTypes";
declare namespace ns4 = "http://b2b.tracfone.com/AccountServices";
declare namespace ns3 = "http://www.tracfone.com/SecurityCommonTypes";
declare namespace ns0 = "http://www.tracfone.com/PhoneCommonTypes";
declare namespace ns5 = "http://www.tracfone.com/AccountDataServices";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/GetEsnListByCriteriaRequest/";

declare function xf:GetEsnListByCriteriaRequest($getEsnListByCriteriaRequest1 as element(ns4:getEsnListByCriteriaRequest))
    as element(ns5:getEsnListByCriteriaRequest) {
        <ns5:getEsnListByCriteriaRequest>
            <ns1:requestToken>
                <ns1:clientTransactionId>{ data($getEsnListByCriteriaRequest1/ns1:requestToken/ns1:clientTransactionId) }</ns1:clientTransactionId>
                <ns1:clientId>{ data($getEsnListByCriteriaRequest1/ns1:requestToken/ns1:clientId) }</ns1:clientId>
            </ns1:requestToken>
            <ns1:brandName>{ data($getEsnListByCriteriaRequest1/ns1:brandName) }</ns1:brandName>
            <ns1:sourceSystem>{ data($getEsnListByCriteriaRequest1/ns1:sourceSystem) }</ns1:sourceSystem>
            {
                for $language in $getEsnListByCriteriaRequest1/ns1:language
                return
                    <ns1:language>{ data($language) }</ns1:language>
            }
            <ns5:loginName>{ data($getEsnListByCriteriaRequest1/ns4:authenticationCredentials/ns3:AccountCredentials/ns2:email) }</ns5:loginName>
            <ns5:password>{ data($getEsnListByCriteriaRequest1/ns4:authenticationCredentials/ns3:AccountCredentials/ns2:password) }</ns5:password>
            <ns5:min>{ data($getEsnListByCriteriaRequest1/ns4:authenticationCredentials/ns3:DeviceCredentials/ns0:deviceId/ns0:min) }</ns5:min>
            <ns5:securityPin>{ data($getEsnListByCriteriaRequest1/ns4:authenticationCredentials/ns3:DeviceCredentials/ns0:securityPin) }</ns5:securityPin>
            <ns5:esn>{ data($getEsnListByCriteriaRequest1/ns4:authenticationCredentials/ns3:DeviceCredentials/ns0:deviceId/ns0:esn) }</ns5:esn>
            <ns5:orderBy>{ data($getEsnListByCriteriaRequest1/ns4:orderBy) }</ns5:orderBy>
            <ns5:orderDirection>{ data($getEsnListByCriteriaRequest1/ns4:orderDirection) }</ns5:orderDirection>
            <ns5:maxRecords>{ xs:string(data($getEsnListByCriteriaRequest1/ns4:maxRecords)) }</ns5:maxRecords>
            <ns5:startIndex>{ xs:string(data($getEsnListByCriteriaRequest1/ns4:startIndex)) }</ns5:startIndex>
            <ns5:criteria>
                {
                    for $filterBy  in ($getEsnListByCriteriaRequest1/ns4:filterBy)  
                    return
                        if ( upper-case(data($filterBy/ns1:keyName))= "ESN") then
                            (<ns5:esn>{data($filterBy/ns1:keyValue)}</ns5:esn>)
                        else 
                            if ( upper-case(data($filterBy/ns1:keyName))= "MIN") then
                                (<ns5:min>{data($filterBy/ns1:keyValue)}</ns5:min>)
                            else 
                                if ( upper-case(data($filterBy/ns1:keyName))= "NICKNAME") then
                                    (<ns5:nickname>{data($filterBy/ns1:keyValue)}</ns5:nickname>)
                                else 
                                    if ( upper-case(data($filterBy/ns1:keyName))= "ESNSTATUS") then
                                        (<ns5:esnStatus>{data($filterBy/ns1:keyValue)}</ns5:esnStatus>)
                                    else 
                                        if ( upper-case(data($filterBy/ns1:keyName))= "OTASTATUS") then
                                            (<ns5:otaStatus>{data($filterBy/ns1:keyValue)}</ns5:otaStatus>)
                                        else 
                                            if ( upper-case(data($filterBy/ns1:keyName))= "BUYERID") then
                                                (<ns5:buyerId>{data($filterBy/ns1:keyValue)}</ns5:buyerId>)
                                            else 
                                                if ( upper-case(data($filterBy/ns1:keyName))= "BUYERTYPE") then
                                                    (<ns5:buyerType>{data($filterBy/ns1:keyValue)}</ns5:buyerType>)
                                                else 
                                                    if ( upper-case(data($filterBy/ns1:keyName))= "ORGNAME") then
                                                        (<ns5:orgName>{data($filterBy/ns1:keyValue)}</ns5:orgName>)
                                                    else 
                                                        if ( upper-case(data($filterBy/ns1:keyName))= "PLANNAME") then
                                                            (<ns5:planName>{data($filterBy/ns1:keyValue)}</ns5:planName>)
                                                        else 
                                                            if ( upper-case(data($filterBy/ns1:keyName))= "PLANDESCRIPTION") then
                                                                (<ns5:planDescription>{data($filterBy/ns1:keyValue)}</ns5:planDescription>)
                                                            else 
                                                                if ( upper-case(data($filterBy/ns1:keyName))= "ESNPARTNUMBER") then
                                                                    (<ns5:esnPartNumber>{data($filterBy/ns1:keyValue)}</ns5:esnPartNumber>)
                                                                else 
                                                                    ""
                }
</ns5:criteria>
            <ns5:credentials>
                <ns3:AccountCredentials>
                    <ns2:email>{ data($getEsnListByCriteriaRequest1/ns4:authenticationCredentials/ns3:AccountCredentials/ns2:email) }</ns2:email>
                    <ns2:password>{ data($getEsnListByCriteriaRequest1/ns4:authenticationCredentials/ns3:AccountCredentials/ns2:password) }</ns2:password>
                </ns3:AccountCredentials>
                <ns3:DeviceCredentials>
                    <ns0:deviceId>
                        {
                            for $min in $getEsnListByCriteriaRequest1/ns4:authenticationCredentials/ns3:DeviceCredentials/ns0:deviceId/ns0:min
                            return
                                <ns0:min>{ data($min) }</ns0:min>
                        }
                        {
                            for $esn in $getEsnListByCriteriaRequest1/ns4:authenticationCredentials/ns3:DeviceCredentials/ns0:deviceId/ns0:esn
                            return
                                <ns0:esn>{ data($esn) }</ns0:esn>
                        }
                    </ns0:deviceId>
                    <ns0:securityPin>{ data($getEsnListByCriteriaRequest1/ns4:authenticationCredentials/ns3:DeviceCredentials/ns0:securityPin) }</ns0:securityPin>
                </ns3:DeviceCredentials>
                <ns3:csrAccountCredentials>
                    <ns2:login>{ data($getEsnListByCriteriaRequest1/ns4:authenticationCredentials/ns3:csrAccountCredentials/ns2:login) }</ns2:login>
                    <ns2:password>{ data($getEsnListByCriteriaRequest1/ns4:authenticationCredentials/ns3:csrAccountCredentials/ns2:password) }</ns2:password>
                    <ns2:customer>{ data($getEsnListByCriteriaRequest1/ns4:authenticationCredentials/ns3:csrAccountCredentials/ns2:customer) }</ns2:customer>
                </ns3:csrAccountCredentials>
                <ns3:accountTokenCredentials>
                    <ns2:token>{ data($getEsnListByCriteriaRequest1/ns4:authenticationCredentials/ns3:accountTokenCredentials/ns2:token) }</ns2:token>
                    <ns2:account>
                        <ns2:accountIdentifierName>{ data($getEsnListByCriteriaRequest1/ns4:authenticationCredentials/ns3:accountTokenCredentials/ns2:account/ns2:accountIdentifierName) }</ns2:accountIdentifierName>
                        <ns2:accountIdentifierValue>{ data($getEsnListByCriteriaRequest1/ns4:authenticationCredentials/ns3:accountTokenCredentials/ns2:account/ns2:accountIdentifierValue) }</ns2:accountIdentifierValue>
                    </ns2:account>
                </ns3:accountTokenCredentials>
                <ns3:csrAccountTokenCredentials>
                    <ns2:token>{ data($getEsnListByCriteriaRequest1/ns4:authenticationCredentials/ns3:csrAccountTokenCredentials/ns2:token) }</ns2:token>
                    <ns2:csrAccount>
                        <ns2:accountIdentifierName>{ data($getEsnListByCriteriaRequest1/ns4:authenticationCredentials/ns3:csrAccountTokenCredentials/ns2:csrAccount/ns2:accountIdentifierName) }</ns2:accountIdentifierName>
                        <ns2:accountIdentifierValue>{ data($getEsnListByCriteriaRequest1/ns4:authenticationCredentials/ns3:csrAccountTokenCredentials/ns2:csrAccount/ns2:accountIdentifierValue) }</ns2:accountIdentifierValue>
                    </ns2:csrAccount>
                    <ns2:customer>
                        <ns2:accountIdentifierName>{ data($getEsnListByCriteriaRequest1/ns4:authenticationCredentials/ns3:csrAccountTokenCredentials/ns2:customer/ns2:accountIdentifierName) }</ns2:accountIdentifierName>
                        <ns2:accountIdentifierValue>{ data($getEsnListByCriteriaRequest1/ns4:authenticationCredentials/ns3:csrAccountTokenCredentials/ns2:customer/ns2:accountIdentifierValue) }</ns2:accountIdentifierValue>
                    </ns2:customer>
                </ns3:csrAccountTokenCredentials>
            </ns5:credentials>
        </ns5:getEsnListByCriteriaRequest>
};

declare variable $getEsnListByCriteriaRequest1 as element(ns4:getEsnListByCriteriaRequest) external;

xf:GetEsnListByCriteriaRequest($getEsnListByCriteriaRequest1)