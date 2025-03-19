## Exercise 1: Loading Data into SQL Database

In this exercise, we will create a **SQL database in Fabric** and ingest data from both **Azure SQL Database** and an **on-premises SQL Server**. 

### Task 1.1: Load Data from Azure SQL Database

In this task, we will use **Dataflow Gen2** to ingest data and efficiently copy it from **Azure SQL Database** to **SQL database in Fabric**.

#### Activity: Create a new Fabric workspace

1. Open **Microsoft Fabric** in a new tab by copy pasting the below link.

   ```BASH
   https://app.fabric.microsoft.com/home
   ```

2.  Sign in with your Azure AD credentials. If you are not already signed in, you will be redirected to the Microsoft Fabric login page.

    >**Note:** Close any pop-up that appears on the screen.

    ![alt text](../media/image5u.png)

    ![alt text](../media/newu.png)

3. From the left navigation pane, click on **Workspaces** and then the **+ New workspace** button.

   ![alt text](../media/image-7.png)

4. In the **Name** field, enter **<inject key="WorkspaceName" enableCopy="true"/>**, then click **Apply**.

    > **Note:** Only use the workspace name provided above.

    ![alt text](../media/f46.png)

    > **Note:** Wait for the Power BI Workspace to load.

   > **Note:** If the **Introducing Task Flows(preview)** pop-up appears, click **Got it**.

     ![alt text](../media/new2u.png)


#### Activity: Create a new SQL Database in Fabric

1. Click on **+ New item** and type **SQL** in the search bar, then select **SQL Database (preview)**.

   ![](../media/database1.png)

2. In the **Name** field, enter **Fabcon_database** and click on the **Create** button. Database creation should take less than a minute.

   ```
   Fabcon_database
   ```

   ![](../media/03.png)

3. When the new database is provisioned, on the **Home page** notice that the Explorer pane is showing database objects.

   ![](../media/f54.png)

4. Under **Build your database**, three useful tiles can help you get your newly created database up and running.

   ![](../media/06.png)

   >**Note** : If you cannot see all the tiles shown in the screenshot, use the arrow mark above to navigate through the remaining tiles.

    ![](../media/new1.png)

- **Sample data** - Lets you import sample data into your Empty database.
- **T-SQL** - Gives you a web-editor that can be used to write T-SQL to create database objects like schema, tables, views, and more. For users who are looking for code snippets to create objects, they can look for available samples in the **Templates** drop down list at the top of the menu.
- **Connection strings** - Shows the SQL database connection string that is required when you want to connect using **SQL Server Management Studio**, the mssql extension with **Visual Studio Code**, or other external tools.


#### Activity: Use Dataflow Gen2 to move data from Azure SQL DB to the SQL Database in Fabric.

1. Click on **Workspaces** and select **<inject key="WorkspaceName" enableCopy="true"/>** workspace.

   ![](../media/new2.png)


2. Click on **+ New item** and select **Dataflow Gen2**.

   ![](../media/dfgen21.png)

3. If the pop-up below appears, accept the default name and click the **Create** button.

   ![](../media/dfgen2.2.png)

3. Click on the **Get data** icon (**not on the dropdown arrow at the bottom of the icon**).

   ![](../media/f47.png)

   >**Note:** If the **Get Data** icon is not visible, expand **New Query** and select the **Get Data** option.

   ![](../media/new3.png)

4. On the **Choose data source** pane, search for **Azure SQL** and click on **Azure SQL database**.

   ![](../media/dfgen2.4.png)

8. On the **Connection settings** pane, in the **Server** field, paste the following value **<inject key="MssqlServer" enableCopy="true"/>**, and in the **Database** field, paste ```SalesDb```.

   ```
   SalesDb
   ```

    ![](../media/dfgen2.5.png)


6.  Scroll down, enter the following details, leave everything else as default, and click **Next**.

      - **Authentication kind** : Basic,
      - **Username** : ``labsqladmin`` 
      - **Password**  : ``Smoothie@2025``
      - <span onclick="copyToClipboard('example')">example</span>  

    ![](../media/dfgen2.6.png)

7. Select ``Suppliers``, ``Website_Bounce_rate``, ``dim_products`` and ``inventory`` tables, then click on the **Create** button.

   ![](../media/f55.png)

8. Click on the ``Suppliers`` table, select the **Add data destination** option from the ribbon, then select **SQL database** from the list.

   ![](../media/f56.png)

9. Click on the **Next** button.

   ![](../media/dfgen2.9.png)

10. Expand the **<inject key="WorkspaceName" enableCopy="true"/>** folder, select the **Fabcon_database** and then click on the **Next** button.

    ![](../media/new4.png)

11. Click on the **Save settings** button.

    ![](../media/dfgen2.11.png)

12. For ``Website_Bounce_rate``, ``dim_products`` and ``inventory`` tables perform steps **8-11** to select the destination.

    >**Note:** Please ensure to select the destination for all the tables before publishing the dataflow.

13. Click on the **Publish** button.

    ![alt text](../media/f21.png)

    >**Note:** Wait for the Dataflow to complete, it will take 2-3 minutes.

#### Activity: Verify the data transfer by querying tables in the SQL Database

1. Click on **Workspaces** and select the **<inject key="WorkspaceName" enableCopy="true"/>** workspace.

   ![](../media/new2.png)


2. Search for **database** and select the **Fabcon_database**.

   ![](../media/database2.png)

3. Click on the **New Query** icon.

   ![](../media/database3.png)

4. Paste the query ```SELECT * FROM dim_products```, click on the **Run** icon and then check the output.

   ```
   SELECT * FROM dim_products
   ```

   ![](../media/g15.png)


### Task 1.2: Load Data from On-Premises Database


Data Factory for Microsoft Fabric is a powerful cloud-based data integration service that allows you to create, schedule, and manage workflows for various data sources. In scenarios where your data sources are located on-premises, Microsoft provides the On-Premises Data Gateway to securely bridge the gap between your on-premises environment and the cloud. 

For this workshop, the **On-Premises Data Gateway** is already provisioned for you and no setup is required by the workshop user, the **gateway connection** can be accessed in your Fabric workspace while setting up the data pipeline. The connection is displayed automatically when database credentials passed on in the pipeline.

#### Activity: Use a Fabric Pipeline to load data from the On-premises database to the SQL Database

1. Click on **Workspaces** and select the **<inject key="WorkspaceName" enableCopy="true"/>** workspace.

   ![](../media/new2.png)

2. Click on **+ New item** and select the **Data pipeline** option.

   ![](../media/datapipeline2.png)

3. In the name field, enter ``Ingest on-premises data using pipeline``and click on the **Create** button.

   ```
   Ingest on-premises data using pipeline
   ```
   ![](../media/24.png)

4. From the **Home** tab of the pipeline editor, click on the **Copy data** dropdown and select **Use copy assistant** option.

   ![](../media/25.png)

5. On the **Home** pane, select the **SQL Server database** option.

    ![](../media/datapipeline3.png)

6. In the **Connection settings** pane, in the **Server** field paste **<inject key="VMName" enableCopy="true"/>** , and paste **FabconDatabase** in the **Database** field. It automatically selects the **Connection**. Click on the **Next** button.
 

   >**Note:** For this workshop, the **On-Premises Data Gateway** is already provisioned for you and no setup is required by the workshop user, the **gateway connection** can be accessed in your Fabric workspace while setting up the data pipeline. The connection is displayed automatically when database credentials passed on in the pipeline.

   ![](../media/f51.png)

7. Now, under the **FabconDatabase** database, click **Select all** and then click on the **Next** button.

   ![](../media/f52.png)

8. Click on **OneLake** and select existing **SQL database**.

   ![](../media/f53.png)

   > **Note :** If you don't see **Fabcon_database**, click the **ellipsis** in the top right corner and adjust **JumpVM's** screen resolution to 90%.

   ![](../media/new3u.png)

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
