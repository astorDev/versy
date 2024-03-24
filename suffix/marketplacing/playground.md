I tend to think there is the best coding routine:

- Start a branch.
- Implement and test changes.
- Merge changes to the forked branch.

<!-- I was set to follow the routine when I started developing my custom GitHub action. I was also planning to publish the action to the GitHub's marketplace. But, studying the docs, ...

I felt that developing a GitHub Action should lay easily in that routine. And it does. Unless, you want to publish your action to the marketplace. 

I felt that developing a GitHub Action should lay easily in that routine. 

The routine seemed to work well with developing a Custom GitHub Action. But ... -->

With that in mind, I was outlining my work on a custom github action. 

I began to study their docs.
Creating an action: 
Use a workflow file for tests.
Noted.
Publishing to the marketplace:
Repository must not contain a workflow file. 
Wait.

<!-- So, I couldn't have 

To test the action I was planning to create a workflow file, as github suggests. After the testing, I was planning to publish the action to the github marketplace. 

So I started reading the marketplace docs. That was when I foun


But, to my surprise, to match the marketplace rules a repository must not contain any workflow file.  -->
 


<!-- This is disappointing and perplexing.
I was wondering how can I have both marketplace-compliant and testable repository.  -->

This is frustraiting. 
I want to have both marketable and testable respository. 
I was perplexed.

Eventually, I decided to have two: the marketplace repository and the testable "motherland" repository.

<!-- 

I was staring at two pictures. My imaginary picture of a rich repository and a poor repository rendering itself from the limitations. I couldn't find a way to mix them. So... I decided to have both:

- The "Motherland" Repository. A container for the actual logic, workflows, tests, and basically everything important.
- The "Marketplace" Repository. The tiniest wrapper around the action from the motherland repository with no purpose other than satisfying marketplace terms. -->


<!-- ... I found out that, to match the [marketplace rules](https://docs.github.com/en/actions/creating-actions/publishing-actions-in-github-marketplace#about-publishing-actions), repository must not contain any workflow file. And, at the same time, creating a workflow file is the [GitHub's suggestion](https://docs.github.com/en/actions/creating-actions/creating-a-composite-action#testing-out-your-action-in-a-workflow) for testing an action.

"Repository must **not** contain any workflow files." to match the marketplace [rules](https://docs.github.com/en/actions/creating-actions/publishing-actions-in-github-marketplace#about-publishing-actions). But to test an action the [GitHub's suggestion](https://docs.github.com/en/actions/creating-actions/creating-a-composite-action#testing-out-your-action-in-a-workflow) is to create a workflow. -->

# xxx

The github action was part of the CI versioning project. I called the project `versy` and that also was the name of the motherland repository. The action goal was to generate versioning `suffix`, based on the current branch. Hence, the

The github action was part of the CI versioning project, called versy. 

The action goal was to generate versioning `suffix`, based on the current branch.

