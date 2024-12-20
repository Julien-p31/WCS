```xml
<ViewerConfig>
  <QueryConfig>
    <QueryParams>
      <Simple>
        <RelativeTimeInfo>0</RelativeTimeInfo>
        <BySource>True</BySource>
        <Channel>DNS Server,Microsoft-Windows-DNS-Client/Operational,System</Channel>
        <Source>Microsoft-Windows-DNS-Client,Microsoft-Windows-DNS-Client-DiagTrack,Microsoft-Windows-DNS-Server-Service</Source>
        <EventId>2,4,409,501-502,6001-6002</EventId>
        <Level>1,2,3,4,0</Level>
      </Simple>
    </QueryParams>
    <QueryNode>
      <Name LanguageNeutralValue="Suivi dédié des événements et de l'état du service DNS">
        Suivi dédié des événements et de l'état du service DNS
      </Name>
      <QueryList>
        <Query Id="0" Path="DNS Server">
          <Select Path="DNS Server">
            *[System[Provider[@Name='Microsoft-Windows-DNS-Client' or @Name='Microsoft-Windows-DNS-Client-DiagTrack' or @Name='Microsoft-Windows-DNS-Server-Service'] 
              and (Level=1  or Level=2 or Level=3 or Level=4 or Level=0) 
              and (EventID=2 or EventID=4 or EventID=409 or  (EventID &gt;= 501 and EventID &lt;= 502)  or  (EventID &gt;= 6001 and EventID &lt;= 6002) )
            ]]
          </Select>
          <Select Path="Microsoft-Windows-DNS-Client/Operational">
            *[System[Provider[@Name='Microsoft-Windows-DNS-Client' or @Name='Microsoft-Windows-DNS-Client-DiagTrack' or @Name='Microsoft-Windows-DNS-Server-Service'] 
              and (Level=1  or Level=2 or Level=3 or Level=4 or Level=0) 
              and (EventID=2 or EventID=4 or EventID=409 or  (EventID &gt;= 501 and EventID &lt;= 502)  or  (EventID &gt;= 6001 and EventID &lt;= 6002) )
            ]]
          </Select>
          <Select Path="System">
            *[System[Provider[@Name='Microsoft-Windows-DNS-Client' or @Name='Microsoft-Windows-DNS-Client-DiagTrack' or @Name='Microsoft-Windows-DNS-Server-Service'] 
              and (Level=1  or Level=2 or Level=3 or Level=4 or Level=0) 
              and (EventID=2 or EventID=4 or EventID=409 or  (EventID &gt;= 501 and EventID &lt;= 502)  or  (EventID &gt;= 6001 and EventID &lt;= 6002) )
            ]]
          </Select>
        </Query>
      </QueryList>
    </QueryNode>
  </QueryConfig>
  <ResultsConfig>
    <Columns>
      <Column Name="Level" Type="System.String" Path="Event/System/Level" Visible="">124</Column>
      <Column Name="Keywords" Type="System.String" Path="Event/System/Keywords">70</Column>
      <Column Name="Date and Time" Type="System.DateTime" Path="Event/System/TimeCreated/@SystemTime" Visible="">174</Column>
      <Column Name="Source" Type="System.String" Path="Event/System/Provider/@Name" Visible="">84</Column>
      <Column Name="Event ID" Type="System.UInt32" Path="Event/System/EventID" Visible="">84</Column>
      <Column Name="Task Category" Type="System.String" Path="Event/System/Task" Visible="">85</Column>
      <Column Name="User" Type="System.String" Path="Event/System/Security/@UserID">50</Column>
      <Column Name="Operational Code" Type="System.String" Path="Event/System/Opcode">110</Column>
      <Column Name="Log" Type="System.String" Path="Event/System/Channel">80</Column>
      <Column Name="Computer" Type="System.String" Path="Event/System/Computer">170</Column>
      <Column Name="Process ID" Type="System.UInt32" Path="Event/System/Execution/@ProcessID">70</Column>
      <Column Name="Thread ID" Type="System.UInt32" Path="Event/System/Execution/@ThreadID">70</Column>
      <Column Name="Processor ID" Type="System.UInt32" Path="Event/System/Execution/@ProcessorID">90</Column>
      <Column Name="Session ID" Type="System.UInt32" Path="Event/System/Execution/@SessionID">70</Column>
      <Column Name="Kernel Time" Type="System.UInt32" Path="Event/System/Execution/@KernelTime">80</Column>
      <Column Name="User Time" Type="System.UInt32" Path="Event/System/Execution/@UserTime">70</Column>
      <Column Name="Processor Time" Type="System.UInt32" Path="Event/System/Execution/@ProcessorTime">100</Column>
      <Column Name="Correlation Id" Type="System.Guid" Path="Event/System/Correlation/@ActivityID">85</Column>
      <Column Name="Relative Correlation Id" Type="System.Guid" Path="Event/System/Correlation/@RelatedActivityID">140</Column>
      <Column Name="Event Source Name" Type="System.String" Path="Event/System/Provider/@EventSourceName">140</Column>
    </Columns>
  </ResultsConfig>
</ViewerConfig>


```
# 📋 Vue personnalisée DNS

Cette vue surveille les événements critiques liés au rôle DNS, comme les démarrages/arrêts du service, les erreurs de résolution de noms, les échecs de chargement de zones, et les problèmes de réplication DNS. Elle facilite le diagnostic rapide et la surveillance continue du service DNS. 🚀

