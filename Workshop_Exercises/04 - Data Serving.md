## Exercise 4: Data Serving

In this exercise, you will create a **semantic model** from the data previously loaded into the **SQL Database in Microsoft Fabric**. You will then use **Copilot** to gain insights and generate a report, enhancing data-driven decision-making. It’s like having a Business Analyst at your beck and call, who does not take coffee breaks, fall sick and is available 24 hours!

---
>**Note:** Follow the steps provided in the task below. The Click-by-Click is available as a backup option in case of any technical issues preventing you from performing the lab in the actual environment.Before starting this exercise, open a backup Click-by-Click using the following hyperlink in a new tab, then return to the browser.
[Click-by-Click](https://regale.cloud/Microsoft/play/4470/04-data-serving#/0/0)
---

### Task 4.1: Build Reports with Power BI

1. Click on **Workspaces** and select the **<inject key="WorkspaceName" enableCopy="false"/>** workspace.

   ![](../media/new2.png)

2. Select the **Fabcon_database**.

   ![](../media/database2.png)

3. Click on **SQL database** from the top right corner and select **SQL analytics endpoint**.

   >**Note:** If clicking on the **SQL Analytics Endpoint** is not working, try refreshing the page and try again.

   ![](../media/f23.png)

5. Click on the **Reporting** tab and select **New semantic model**.

   ![](../media/f24.png)

6. In the **Name** field, enter ``website_bounce_rate_model``.

   ```
   website_bounce_rate_model
   ```

7. Select workspace as **Fabcon** and click on the **Expand** icon next to the **dbo** checkbox.

   ![](../media/f25u.png)

8. Click on the **Expand** icon next to the **Tables** checkbox.

   ![](../media/f26.png)

9. Scroll down if you see a scroll bar and select **website_bounce_rate table**, then click on the **Confirm** button.

   ![](../media/f26uu.png)

   **Note:** Wait for the semantic model creation.

#### Activity: Connect Power BI to the SQL Database in Fabric

1. Click on the **<inject key="WorkspaceName" enableCopy="false"/>** workspace from the left navigation menu. Click on **Filter** and under **Type**, select **Semantic model**.

   > **Note:** Clear any filters related to SQL Database from the filter section.

2. Click on the **website_bounce_rate_model** semantic model.

   ![](../media/f28000.png)

3. To create a new report using this semantic model, expand **Explore this data** in the top bar and click on **Create a blank report**.

   ![](../media/f29.png)

4. Click on the **Settings** icon and select **Power BI settings** from the **Resources and extensions** section.

   ![alt text](../media/img.png)

5. Select the **Semantic models** tab and select your Semantic model.

   ![alt text](../media/img-1.png)

6. Scroll down to the **Q&A** section and expand it, then select the **Turn on Q&A to ask natural language questions about your data** checkbox, and click on **Apply** button.

   ![alt text](../media/img-2.png)

   >**Note:** If it is already applied, proceed to the next step.

7. Click on **Untitled report** or the **Report** created in earlier steps from the left menu.

   ![alt text](../media/img-3.png)


#### Activity: Use Copilot AI in Power BI to enhance report creation and generate insights

1. Click on the **Copilot** icon and collapse the other panes named Filters, Visualizations and Data.

   ![alt text](../media/img-4.png)

    >**Note:** Close any pop-up that appears on the screen.

    ![alt text](../media/img-5.png)

2. Toggle the **Preview** button to the right side to enable it and click on **Get started**.

   ![alt text](../media/img-6.png)

    You will now see how easy it is for a Data Analyst to create compelling Power BI reports and get deep insights with literally no hands-on coding!
	
3. Click on the **Prompt Guide** button.

   ![alt text](../media/img-7.png)

4. Select the option **What's in my data?**

    > **Note:** If you don't see the 'What's in my data?' option, click in the Copilot **chat box** field, enter the following prompt, and click on the **Send** button.

    ```
    What's in my data?
    ```

    ![alt text](../media/img-8.png)

    The first option, 'What’s in my data?' provides an overview of the contents of the dataset, identifies and describes what’s in it and what the attributes are about. So, there’s no need to wait for someone to explain the dataset. This improves the efficiency and volume of report creation.

    ![alt text](../media/img-9.png)

    >**Note :** The Copilot response you receive may differ from the one shown in the screenshot.

5. Click on the **Copilot chat box** field and enter the following prompt:

    ```
    Create a report Bounce Rate analysis, to show the correlation between customer sentiment, particularly among millennials and Gen Z, unsuccessful product searches across different devices, and the website's bounce rate by customer generations.
    ```


6. Click on the **Send** button and wait for the results to load. 

   ![alt text](../media/img-10.png)

7. If a pop-up similar to the one in the screenshot appears to edit the **Report title**, click anywhere on the **report** to **close it**.

   ![alt text](../media/editpopup.png)
	
    >**Note:** 

    - If Copilot is not generating a visualization report, retry by using the same prompt again.
    
    - If you see the error message saying, 'Something went wrong.', try refreshing the page and restart the task. Being in a shared environment, the service may be busy at times.

    - If Copilot needs additional context to understand your query, consider rephrasing the prompt to include more details.

    >**Note:** The responses from Copilot may not match the ones in the screenshot but will provide a similar response.

   ![alt text](../media/img-11.png)

    Based on this report, we notice that the website bounce rate for Contoso is especially high amongst the Millennial customer segment. Let’s ask Copilot if it has any recommendations for improving this bounce rate based on the results and data in the report.

    We’ll ask Copilot for suggestions based on the results and data in the report. 

8. Enter the following prompt in Copilot, and press the **Send** button.

    ```
    Based on the data in the page, what can be done to improve the bounce rate of millennials?
    ```

	
   ![alt text](../media/img-12.png)
	
9. Look at the suggestions Copilot provided. Copilot creates the desired Power BI report and even goes a step further to give powerful insights. To improve the website bounce rate, Contoso needs to transform their mobile website experience for millennials. This helps them reduce their millennial related customer churn too! Now, what if Contoso’s leadership team needed a quick summary of this entire report? **Smart Narrative** to the rescue!
	
    ![alt text](../media/img-15.png)
	
10. Expand the **Visualizations** pane and select the **Narrative** visual. 

    ![alt text](../media/f30.png)

11. Click on **Copilot (preview)** within the visual.

    ![alt text](../media/img-13.png)
	
12. Select **Give an executive summary**. 

13. Click on **Update** and observe the generated summary. See how easy it was to get an executive summary with absolutely no IT resource dependency!
 
    >**Note:** If you don't see the 'Give an executive summary' option, click on the **Copilot narrative** chat box field, enter the following prompt, and click on **Update**:
    ``Summarize the data, provide an executive summary, indicating important takeaways.``

    ![alt text](../media/img-16.png)

14. Expand the narrative from the corner to get a better readable view of the result.

    ![alt text](../media/img-17.png)

15. Click on the **Close** button in the pop-up window.

    ![alt text](../media/img-18.png)
	
    The summary can also be generated in another language, if specified. Additionally, the summary updates if you filter the report on any visual.

    Congratulations! You have now successfully generated a report using the data that was landed earlier in the **SQL Database**. You are ready to move on to the next exercise: Exploring GraphQL API Endpoints in Microsoft Fabric.

 Move to the next page to continue!
