---
title: >
    Releasing a Flutter IOS App: My AppStore Story
---

# Releasing a Flutter IOS App: My AppStore Story

My app [Finrir](https://apps.apple.com/us/app/finrir/id6472634631) was recently granted a spot among 1.8 million other AppStore apps. I have even released a few updates afterward. But I've walked a surprisingly long journey to get here. In this article, I'll share my experience and shed light on what one can expect when publishing an app to AppStore.

![Releasing Before After](thumb.png)

## First Attempt: Tasky

The story actually starts from another creation of mine - a simple to-do list app, I called `Tasky`. My plan was to create a minimalistic to-do list, ship it to AppStore as quickly as possible, learn the process, and decide on the next steps based on that. This is what the app looked like in a nutshell:

![Tasky Demo](tasky-demo.gif)

Two days after I sent the app to review I received a rejection letter. The letter listed two reasons for the rejection:

> ## Guideline 2.3.10 - Performance - Accurate Metadata
> 
> We noticed your submission includes irrelevant references to your app’s development process. 
> 
> Specifically, your screenshots include debug banners.


That reason made sense since I forgot to remove the annoying flutter debug banner. This was reasonable and easy to fix. But the second rejection reason was much more disturbing:

> ## Guideline 4.3 - Design
> 
> We noticed that your app provides the same feature set as other apps submitted to the App Store; it simply varies in content or language, which is considered a form of spam.

Although I agree my app didn't have a unique feature set the reason seems too arbitrary. The app wasn't supposed to be very unique, but it wasn't just varying in content or language - it has its own user experience. It just seems that Apple should have a more sophisticated reason to reject an app, keeping in mind that I'm paying for the developer subscription. I received the rejection in July. After the rejection, I decided to focus on the main app in the story and it took me 5 months to prepare to send an app to review one more time.

## The Freezing Winter

The next time I submitted the app was on the 9th of December. On the 11th of December, I got a rejection letter. However, that wasn't actually a rejection letter. This is what it said:

> Hello,
> 
> Thank you for submitting your app for review.
> 
> We need additional time to evaluate your submission and Apple Developer Program account. Your submission status will appear as "Rejected" in App Store Connect while we investigate. However, we do not require a revised binary or additional information from you at this time.
> 
> While there may be a delay due to high submission volumes, we are working to complete our review as soon as possible. If we notice any issues that require your attention, we will let you know via App Store Connect. If we find no issues with your submission or account, the submission will be approved.
> 
> We will notify you as soon as there is new information to share. Other review inquiries may be filed via the Apple Developer Contact Us page.

You may ask, why not just leave it as a "Pending Review"? That's a mystery to me, too. Anyway, I started waiting. But by the 14th of January, I was pretty confident my submission was forgotten. Plus, I've made some changes to the app at this time, so I've created a new review submission. I got a new rejection a month later, on Feb 16. This is the two rejection reasons it listed:

> ## Guideline 5.1.1(v) - Data Collection and Storage
> 
> We noticed that your app supports account creation but does not appear to include an option to initiate account deletion. 
> 
> Apps that support account creation must also offer account deletion to give App Store users more control of the data they've shared while using your app.

Which is a valid point and was pretty trivial to fix. The second reason was quite similar:

> ## Guideline 5.1.1 - Legal - Privacy - Data Collection and Storage
> 
> We noticed that your app requires users to register or log in to access features that are not account based.
> 
> Apps may not require users to enter personal information to function, except when directly relevant to the core functionality of the app or required by law. For example, an e-commerce app should let users browse store offerings and other features that are not account based before being asked to register, or a restaurant app should allow users to explore the menu before placing an order. Registration must then only be required for account-specific features, such as saving items for future reference or placing an order.

Which is also fair, but requires fundamental changes to the app. All in all, the review process was ridiculously long and unpleasant. It took me 4 months to prepare for the next attempt. 

## The Summer Boom

So, I've removed user registration process altogether, this time. And on the 4th of July, I've submitted my app one more time. Guess when it received a review results? On the same day! Imagine how surprised I was when previously the process took one month! Moreover, the review was successful

![](v1.0.png)

Pretty soon, I've made an update to the app. This is how the next version review went:

![](v1.1.png)

Pretty good, huh? I tried one more time and the results were similar:

![](v1.2.png)

I wonder if that's really something related to the season. Anyway, things looking much more pleasant in the summer.

## This is Where We Are Now

This is my experience with AppStore, so far. It wasn pretty hostile in the beginning, but turned normal in the end. The future holds a lot more releases, so let's see what else I'll figure out about AppStore releases. I'll probably write another article if something interesting pops up ... for now, claps are appreciated! 👏
