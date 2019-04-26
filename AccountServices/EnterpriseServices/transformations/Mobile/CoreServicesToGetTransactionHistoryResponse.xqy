xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getTransactionHistoryResponse1" element="acccore:getTransactionHistoryResponse" location="../../../CoreServices/xsd/AccountCoreServices.xsd" ::)
(:: pragma bea:global-element-return element="acc:getTransactionHistoryResponse" location="../../xsd/MobileAccountServices.xsd" ::)

declare namespace run = "http://www.tracfone.com/RuntimeFault";
declare namespace acct = "http://www.tracfone.com/AccountCommonTypes";
declare namespace acccore = "http://www.tracfone.com/AccountCoreServices";
declare namespace acc = "http://b2b.tracfone.com/MobileAccountServices";
declare namespace com = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/Mobile/CoreServicesToGetTransactionHistoryResponse/";

declare function xf:CoreServicesToGetTransactionHistoryResponse($getTransactionHistoryResponse1 as element(acccore:getTransactionHistoryResponse))
    as element(acc:getTransactionHistoryResponse) {
        <acc:getTransactionHistoryResponse>
            <com:result>
                <com:code>{ data($getTransactionHistoryResponse1/com:result/com:code) }</com:code>
                <com:message>{ data($getTransactionHistoryResponse1/com:result/com:message) }</com:message>
            </com:result>
            {
                for $RuntimeFaultMessage in $getTransactionHistoryResponse1/run:RuntimeFaultMessage
                return
                    <run:RuntimeFaultMessage>{ $RuntimeFaultMessage/@* , $RuntimeFaultMessage/node() }</run:RuntimeFaultMessage>
            }
            <acc:totalTransactions>{ data($getTransactionHistoryResponse1/acccore:totalTransactions) }</acc:totalTransactions>
            {
                let $transactionList := $getTransactionHistoryResponse1/acccore:transactionList
                return
                    <acc:transactionList>
                        {
                            for $transaction in $transactionList/acccore:transaction
                            return
                                <acc:transaction>
                                    {
                                        let $trasactionInfo := $transaction/acccore:trasactionInfo
                                        return
                                            <acc:trasactionInfo>
                                                <acct:transactionDate>{ fn:concat(fn:substring(data($trasactionInfo/acct:transactionDate), 6, 2),'-',fn:substring(data($trasactionInfo/acct:transactionDate), 9, 2),'-',fn:substring(data($trasactionInfo/acct:transactionDate),1,4)) }</acct:transactionDate>
                                                <acct:transactionType>{ data($trasactionInfo/acct:transactionType) }</acct:transactionType>
                                                <acct:transactionTotal>{ data($trasactionInfo/acct:transactionTotal) }</acct:transactionTotal>
                                                <acct:transactionId>{ data($trasactionInfo/acct:transactionId) }</acct:transactionId>
                                                <acct:transactionStatus>{ data($trasactionInfo/acct:transactionStatus) }</acct:transactionStatus>
                                            </acc:trasactionInfo>
                                    }
                                    {
                                        let $paymentSource := $transaction/acccore:paymentSource
                                        return
                                            <acc:paymentSource>
                                                <acct:paymentSourceNickname>{ data($paymentSource/acct:paymentSourceNickname) }</acct:paymentSourceNickname>
                                                <acct:paymentSourceType>{ data($paymentSource/acct:paymentSourceType) }</acct:paymentSourceType>
                                                <acct:paymentSourceNumberMask>{ data($paymentSource/acct:paymentSourceNumberMask) }</acct:paymentSourceNumberMask>
                                            </acc:paymentSource>
                                    }
                                    {
                                        let $device := $transaction/acccore:device
                                        return
                                            <acc:device>
                                                <acct:deviceNickName>{ data($device/acct:deviceNickName) }</acct:deviceNickName>
                                                {
                                                  if (fn:starts-with(fn:data($device/acct:min),'T'))
                                                  then <acct:min></acct:min>
                                                  else (<acct:min>{ data($device/acct:min) }</acct:min>)
                                                }
                                            </acc:device>
                                    }
                                </acc:transaction>
                        }
                    </acc:transactionList>
            }
        </acc:getTransactionHistoryResponse>
};

declare variable $getTransactionHistoryResponse1 as element(acccore:getTransactionHistoryResponse) external;

xf:CoreServicesToGetTransactionHistoryResponse($getTransactionHistoryResponse1)