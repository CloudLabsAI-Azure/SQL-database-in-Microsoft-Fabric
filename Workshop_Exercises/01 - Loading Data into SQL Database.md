## Exercise 1: Loading Data into SQL Database

In this exercise, we will create a **SQL database in Fabric** and ingest data from both **Azure SQL Database** and an **on-premises SQL Server**. 

### Task 1.1: Load Data from Azure SQL Database

In this task, we will use **Dataflow Gen2** to ingest data and efficiently copy it from **Azure SQL Database** to **SQL database in Fabric**.

#### Activity: Create a new Fabric workspace

1. Open a new tab and paste ``app.powerbi.com`` then press **Enter**.

2. Enter your **<inject key="AzureAdUserEmail"></inject>** in the **Email** field, then click on the **Submit** button.

   ![alt text](../media/image.png)

3. Enter your **Password:** <inject key="AzureAdUserPassword"></inject> and click on the **Sign in** button.

   ![alt text](../media/image-1.png)

4. If prompted to stay signed in, click on **Yes**.

   ![alt text](../media/image-2.png)

   > **Note:** Close any pop-up that appears on the screen.

   ![alt text](../media/image-3.png)

   > **Note:** If you see the following screen, continue with the following steps or directly move to step number **8**.

5. Click on the **Continue** button.

   ![alt text](../media/image-4.png)

6. Click on the **Business phone number** textbox and type a 10-digit number ```1230000849```. Click on the **Get Started** button.

   ![alt text](../media/image-5.png)

7. Again, click on the **Get Started** button.

   ![alt text](../media/image-6.png)

   > **Note:** Wait for the Power BI workspace to load and close the top bar for a better view.

8. From the left navigation pane, click on **Workspaces** and then the **+ New workspace** button.

   ![alt text](../media/image-7.png)

9. In the **Name** field, enter **Fabcon-<inject key="Deployment ID"/>**, then click **Apply**.

    > **Note:** Only use the workspace name provided above.

    > **Note:** If the name is already taken, refresh the page and check again. A workspace with that name may already be created. If so, add a different suffix until the name is available.

    ![alt text](../media/f46.png)

    > **Note:** Wait for the Power BI Workspace to load.

    ![alt text](../media/image-9.png)


#### Activity: Create a new SQL Database in Fabric

1. Click on **+ New item** and type **SQL** in the search bar, then select **SQL Database (preview)**.

   ![](../media/database1.png)

2. In the **Name** field, enter ```Fabcon_database``` and click on the **Create** button. Database creation should take less than a minute.

   ![](../media/03.png)

3. When the new database is provisioned, on the **Home page** notice that the Explorer pane is showing database objects.

   ![](../media/f54.png)

4. Under **Build your database**, three useful tiles can help you get your newly created database up and running.

   ![](../media/06.png)

- **Sample data** - Lets you import sample data into your Empty database.
- **T-SQL** - Gives you a web-editor that can be used to write T-SQL to create database objects like schema, tables, views, and more. For users who are looking for code snippets to create objects, they can look for available samples in the **Templates** drop down list at the top of the menu.
- **Connection strings** - Shows the SQL database connection string that is required when you want to connect using **SQL Server Management Studio**, the mssql extension with **Visual Studio Code**, or other external tools.


#### Activity: Use Dataflow Gen2 to move data from Azure SQL DB to the SQL Database in Fabric.

1. Click on **Workspaces** and select **Fabcon-<inject key="Deployment ID" enableCopy="false"/>** workspace.

   ![](../media/datapipeline1.png)


2. Click on **+ New item** and select **Dataflow Gen2**.

   ![](../media/dfgen21.png)

3. Click on **Create** button.

   ![](../media/dfgen2.2.png)

3. Click on the **Get data** icon (**not on the dropdown arrow at the bottom of the icon**).

   ![](../media/f47.png)

4. On the **Choose data source** pane, search for **Azure SQL** and click on **Azure SQL database**.

   ![](../media/dfgen2.4.png)

   >**Note:** Note: To fill in the details for required fileds, we need to fetch the details from the SQL Database resource deployed in the Azure Portal.

   ![](../media/g10.png)

5. Navigate to the **Azure Portal**, in the resource group **rg-fabcon-<inject key="Deployment ID" enableCopy="false"/>**, search for **sql** in the resource group window and click on the **mssql...** resource.

   ![](../media/g11.png)

6. Copy the **Server** name.

   ![](../media/g12.png)

7. Navigate back to the **Fabric** tab on your browser.

8. On the **Connection settings** pane, in the **Server** field, paste the value you copied in step number **6**, and in the **Database** field, paste ```SalesDb```.

    ![](../media/dfgen2.5.png)


6.  Scroll down and select **Basic** in the **Authentication kind** dropdown. Enter ``labsqladmin`` as the **Username**, ``Smoothie@2025`` as the **Password** and click on the **Next** button.

    ![](../media/dfgen2.6.png)

7. Select ``Suppliers``, ``Website_Bounce_rate``, ``dim_products`` and ``inventory`` tables, then click on the **Create** button.

   ![](../media/f55.png)

8. Click on the ``Suppliers`` table, select the **Add data destination** option from the ribbon, then select **SQL database** from the list.

   ![](../media/f56.png)

9. Click on the **Next** button.

   ![](../media/dfgen2.9.png)

10. Expand the **Fabcon** folder, select the **Fabcon_database** and then click on the **Next** button.

    ![](../media/g13.png)

11. Click on the **Save settings** button.

   ![](../media/dfgen2.11.png)

12. For ``Website_Bounce_rate``, ``dim_products`` and ``inventory`` tables perform steps **8-11** to select the destination.

    >**Note:** Please ensure to select the destination for all the tables before publishing the dataflow.

13. Click on the **Publish** button.

    ![alt text](../media/f21.png)

    >**Note:** Wait for the Dataflow to complete, it will take 2-3 minutes.

#### Activity: Verify the data transfer by querying tables in the SQL Database

1. Click on **Workspaces** and select the **Fabcon-<inject key="Deployment ID" enableCopy="false"/>** workspace.

   ![](../media/datapipeline1.png)


2. Search for **database** and select the **Fabcon_database**.

   ![](../media/database2.png)

3. Click on the **New Query** icon.

   ![](../media/database3.png)

4. Paste the query ```SELECT * FROM dim_products```, click on the **Run** icon and then check the output.

   ![](../media/g15.png)


### Task 1.2: Load Data from On-Premises Database


Data Factory for Microsoft Fabric is a powerful cloud-based data integration service that allows you to create, schedule, and manage workflows for various data sources. In scenarios where your data sources are located on-premises, Microsoft provides the On-Premises Data Gateway to securely bridge the gap between your on-premises environment and the cloud. 

For this workshop, the **On-Premises Data Gateway** is already provisioned for you and no setup is required by the workshop user, the **gateway connection** can be accessed in your Fabric workspace while setting up the data pipeline. The connection is displayed automatically when database credentials passed on in the pipeline.

<!--
1. Open a new tab in your virtual machine browser and paste the follwing URL, it will download gateway application.

[Download the standard gateway](https://go.microsoft.com/fwlink/?LinkId=2116849&clcid=0x409)

2. In the gateway installer, keep the default installation path, accept the **terms of use**, and then select **Install**.

![](../media/13.png)

3. In **email address to use with this gateway** field, enter **+++@lab.CloudPortalCredential(User1).Username+++** and then select **Sign in**.

![](../media/14.png)

4.  Enter the password by clicking on +++@lab.CloudPortalCredential(User1).Password+++ and click on **Sign in**.

![alt text](../media/image-1.png)

5. Select **Register a new gateway on this computer** and click on **Next**.

![](../media/15.png)

6. Enter a name for the gateway as **Datagateway@lab.LabInstance.Id** and in **Recovery Key** field enter +++@lab.CloudPortalCredential(User1).Password+++ and enter the same value in **Confirm recory key** field and click on **Configure**.

![](../media/16.png)

7. Review the information in the final window. Note that the gateway is available for Microsoft Fabric. Select **Close**.

![](../media/17.png)



#### Set up a gateway connection to access on-premises data sources

1. Navigate to Azure portal(https://portal.azure.com/) and search for **Resoucegroup**.

![](../media/g1.png)

2. Click on **rg-fabcon-suffix**, copy **virtual machine name** and save it on your notpad.

![](../media/g2.png)

3. Navigate back to Microsoft Fabric tab, click on the **Settings** button (an icon that looks like a gear) at the top right of the page. Then choose **Manage connections and gateways** from the dropdown menu.

![](../media/18.png)

4. Click on **+ New** from top left corner.

![](../media/19.png)

5. Select **On-premises**,

- From **Gateway cluster name** dropdown, select **datagateway**

>**Note:** You'll have a suffix concatenated with your Gateway cluster name.

- In **Connection name** field, enter ``on-premisesgateway``.

- From the **Connection type** dropdown, select ``SQL Server``.

- In the **Server** field, enter the Virtual Machine name you copied in **step 2**

- In the **Database** field, enter ``FabconDatabase``.

![](../media/g3.png)

- In the **Authentication method** dropdown, select **Windows**.
- In the **Username** field, enter the virtual machine name you copied in **Step 2** and append ``\azureuser`` to it. It should look like ``FabconVMxyz\azureuser``.
- In the **Password** field, enter ``Fabcon@2025``.
- In the **Privacy level** dropdown, select **None** and click on the **Create** button.

![](../media/g4.png)

6. Scroll up to verify that the connection has been **created**.

![](../media/g5.png)
-->

#### Activity: Use a Fabric Pipeline to load data from the On-premises database to the SQL Database

1. Click on **Workspaces** and select the **Fabcon-<inject key="Deployment ID" enableCopy="false"/>** workspace.

   ![](../media/datapipeline1.png)

2. Click on **+ New item** and select the **Data pipeline** option.

   ![](../media/datapipeline2.png)

3. In the name field, enter ``Ingest on-premises data using pipeline``and click on the **Create** button.

   ![](../media/24.png)

4. From the **Home** tab of the pipeline editor, click on the **Copy data** dropdown and select **Use copy assistant** option.

![](../media/25.png)

5. On the **Home** pane, select the **SQL Server database** option.

    ![](../media/datapipeline3.png)

6. In the **Connection settings** pane, in the **Server** field paste **FabconVM<inject key="Deployment ID" enableCopy="false"/>** , and paste **FabconDatabase** in the **Database** field. It automatically selects the **Connection**. Click on the **Next** button.
 

   >**Note:** For this workshop, the **On-Premises Data Gateway** is already provisioned for you and no setup is required by the workshop user, the **gateway connection** can be accessed in your Fabric workspace while setting up the data pipeline. The connection is displayed automatically when database credentials passed on in the pipeline.

   ![](../media/f51.png)

7. Now, under the **FabconDatabase** database, click **Select all** and then click on the **Next** button.

   ![](../media/f52.png)

8. Click on **OneLake** and select existing **SQL database**.

   ![](../media/f53.png)
<!--
9. Scroll down and click on the checkbox beside **Allow this connection to be utilized with either on-premises or VNet data gateways** and then click on **Sign in**.

![](../media/datapipeline10.png)

>**Note:** If you don’t see the **Allow this connection to be utilized with either on-premises or VNet data gateways** checkbox, duplicate your current tab and follow the steps below. Otherwise, continue from **Step 14**.

10. Click on the **Settings** button (an icon that looks like a gear) at the top right of the page. Then choose **Manage connections and gateways** from the dropdown menu.

![](../media/18.png)

11. Click on **Connections**, then click the ellipsis (three dots) next to the **FabricSql** connection and select **Settings**.

![](../media/f68.png)

12. Click on the checkbox beside **Allow this connection to be utilized with either on-premises or VNet data gateways** and click on the **Save** button.

![](../media/f69.png)

13. Navigate back to your Previous tab and click on **Sign in**

![](../media/f70.png)

14. Click on your **Entra ID** username.

![](../media/datapipeline8.png)

15. Click on **Connect**.

![](../media/datapipeline9.png)
-->
#### Activity: Validate the data transfer and ensure schema compatibility

1. Select the **Load to new table** radio button and click on the **Next** button.

   ![](../media/datapipeline13.png)

2. Click on **Save + Run**.

   ![](../media/datapipeline11.png)

3. Click on the **Ok** button in the **Pipeline run** window..

   ![](../media/datapipeline12.png)

4. Click on the **Bell** icon at the top right of the screen to verify the Running status of the pipeline.

   ![](../media/datapipeline14.png)

   There you go! Your data has been transferred from the on-premises SQL database to the Fabric SQL database.

   Congratulations! You have successfully created your database in a new Fabric workspace and ingested data from both **Azure SQL Database** and an **on-premises SQL Server**. You are ready to move on to the next exercise: [Introduction to Copilot for SQL Database](https://github.com/dreamdemos-ms/Fabcon_Workshop/blob/main/Workshop_Exercises/02%20-%20Introduction%20to%20Copilot%20for%20SQL%20Database.md)
