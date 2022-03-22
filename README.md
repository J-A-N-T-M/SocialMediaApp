# The Social Club

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Draws up a feed that is populated based on a user's interest and where one can join others in groups that share the same interests. 
### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Social Networking(location, camera, notifications, etc.)
- **Mobile:** Location, camera, notifications, etc.
- **Story:** Truly personalized experience
- **Market:** Mainly young adults(18-35) stepping into a new space (new job, college, etc.) and trying to connect with others
- **Habit:** Users would be inclined to use the app frequently, especially since it's catered to their specific interests and they can post as well
- **Scope:** It is challenging because this social media app is unlike any other, however it is still a social media app so we will still be able to implement the concepts that we've learned in class.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can login/logout
* User can create an account
* User can search/follow interests/other accounts
* User can create/join groups
* User can post (only text)
* User update account information/settings 

**Optional Nice-to-have Stories**

* User can upload pictures and videos 
* User can see other user's locations (if enabled) on a map to see if there are users around them with the same interests
* Real time location

### 2. Screen Archetypes

* Login Screen
   * User can login/logout
   
* Account Creation Screen
   * User can create an account

* Home Screen
   * User can post
   * User can create/join groups 

* Search Screen
   * User can search/follow interests/other accounts

* Account Settings Screen
   * User update account information/settings

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home
* Search
* Profile

**Flow Navigation** (Screen to Screen)

* Login Screen
   * => Account Creation Screen
   * => Home screen
* Account Creation Screen
   * => Home Page
* Home Page
   * => Account Settings Screen
   * => Search Screen
* Search Screen
   * => Home Screen
   * => Account Settings Screen 
* Account Settings Screen
   * => Login Screen
   * => Home Screen
   * => Search Screen 
 

## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="YOUR_WIREFRAME_IMAGE_URL" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
