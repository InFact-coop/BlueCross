# Blue Cross

See our design for Blue Cross' **Giving a pet** **[here](https://bluecross.surge.sh/)** :eyes:

## The Challenge :dog: :hamster:

We came into Blue Cross excited by the idea of some kind of pet-to-owner matchmaking service. What we weren't prepared for coming in was the complexity of the challenges facing animal welfare charities today. We heard stories of:

* a charity **overwhelmed by demand** for pets that they simply didn't have the capacity to fill
* an **unregulated marketplaces** thriving on a
* **convenience-seeking public**
* the complex emotions of **stigma** and **fear of judgement** brought on when giving up your pet
* **Unscrupulous breeders** misselling animals, and even
* **trafficking** and organised crime

We were welcomed and well introduced to the problems at hand to by our Product Owner Kelly, who gave us our problem statement to think on:

> _I want to rescue a pet, but the pets that are available might not be the breeds I want. I want to find the pet, buy it and pick it up quickly within a number of days. I want to know its history, its behaviour and to know it was not bred unethically. Welfare, health and behvaiour needs must be taken into account before they buy the pet._

We spent the morning split up into three groups, exploring the statement from the perspective of three broad personas: the **rehomer** (the person having to part with a pet), the **prospective owner** (the person looking for a pet), and the **marketplace** (the employee for largely unregulated markets such as Gumtree or Preloved).

We spent the latter half of the day creating app ideas catering to different facets of this problem, and finally settled upon

## Our Solution :circus_tent:

**Blue Cross : Giving a Pet**

> A companion app for conscientious owners to find a loving new home for their pets

**The aims of the solution**

* To give rehomers a **viable alternative** to marketplaces like Gumtree
* To reassure them through **positive language** that Blue Cross has the best interests of the animal at heart
* To assess the rehousing application in terms of need, and **triage** them appropriately
* To covertly **flag up** for signs of wrongdoing through questionnaires
* To make the app **sensitive**, **warm**, and **easy to use** for what could be an emotional, transitionary stage in our users' lives

### Process :clipboard:

**Prototype**  
We then created static designs using an online tool called Figma. This allowed us to map the rough user journey and provide us with a chance to have rapid feedback on the designs prior to building the product with code.

Below are the designs we created _*(note: the final designs have changed since these)*_

> The user is greeted by a positive and understanding message. The choice of name **"Giving a pet"** is deliberately focusing on an act of generosity

> The triage happens immediately, allowing Blue Cross to know how urgently they need to respond

<img width="410" alt="screen shot 2017-12-12 at 9 33 46 pm" src="https://user-images.githubusercontent.com/22657280/33910187-c4891e0e-df85-11e7-91cc-374307b3148f.png">

> We ask for a level of detail about the animal that fosters a sense of trust in our capability

<img width="410" alt="screen shot 2017-12-12 at 9 34 22 pm" src="https://user-images.githubusercontent.com/22657280/33910188-c4cf906e-df85-11e7-8a5c-fb2dd5959d64.png">

> We ensure the animal has recieved the minimum level of health treatment
> Asking these questions also flags up the potential for maltreatment

<img width="410" alt="screen shot 2017-12-12 at 9 35 47 pm" src="https://user-images.githubusercontent.com/22657280/33910191-c504e1e2-df85-11e7-9dc7-702a45bd8678.png">

> Rehomers are given a sense of control over the process when we ask them questions about the kind of new home they imagine for their pet

<img width="410" alt="screen shot 2017-12-12 at 9 36 18 pm" src="https://user-images.githubusercontent.com/22657280/33910192-c547ad2e-df85-11e7-847b-34d2bc1c1342.png">

> Videos allow the Blue Cross team a window into the animals's life, where they are able to search for telltale signs of their wellbeing and treatment

<img width="410" alt="screen shot 2017-12-12 at 9 36 42 pm" src="https://user-images.githubusercontent.com/22657280/33910193-c576c1c2-df85-11e7-9212-35ce48fb11a3.png">

> The map uses the gap between "supply" and "demand" of pets to prompt the rehomer to continue

<img width="410" alt="screen shot 2017-12-12 at 9 36 55 pm" src="https://user-images.githubusercontent.com/22657280/33910194-c59d3c80-df85-11e7-90dc-3d76b14867f8.png">

> The rehomer is given still greater control over the process

<img width="410" alt="screen shot 2017-12-12 at 9 37 31 pm" src="https://user-images.githubusercontent.com/22657280/33910195-c5b9b78e-df85-11e7-8eef-5c007a940d51.png">

> A resolution page gives a heartfelt thank you with an image of a dog and a loving owner, suggesting a successful rehoming

<img width="410" alt="screen shot 2017-12-12 at 9 37 44 pm" src="https://user-images.githubusercontent.com/22657280/33910196-c5e16e78-df85-11e7-8b11-e10068a2090b.png">

## Further Development :wrench:

### User Testing :two_women_holding_hands::two_women_holding_hands:

User testing allows you to get feedback from your primary users to check that the product being built fits their needs. This is **very** important to build a successful product.

**The three key points for testing are:**

* Have a script which has tasks for them to complete. **[here](https://github.com/InFact-coop/BlueCross/blob/master/usertest.md)** is an example of a script which you can use and modify
* Ask for people to give you a commentary of what they are doing, but don't respond to them
* Document their response

**Additional recommendations for _*your*_ user testing:**

* Ask user to complete the flow and explain what they are thinking throughout the process
  * Make **_lots_** of notes. It is good to have someone guiding the user and someone note taking so nothing is missed!
  * Try and gather if the user understands the purpose of the app and if the interactions are intuitive
  * Try to understand further if the types, quantity and copy of the questions is appropriate for the audience.
  * Does the user feel like this can help make a difference?
* Users may comment on aesthetics **but** unless the same comments are brought up several times these comments are **_usually_** not important. The focus should be on the users interactions and understanding of the product.

Here are some **useful resources** to look at when completing your user testing sessions:

* [Googles Gurilla Testing Advice](https://www.youtube.com/watch?v=0YL0xoSmyZI&feature=youtu.be)
* [Script Guidance and Template](https://github.com/foundersandcoders/master-reference/blob/master/coursebook/weeks-10-12/user-testing.md#1-planning)
* [Steve Krug user testing script](https://sensible.com/downloads/test-script.pdf)

### Next Sprints :runner:

If this design is move forward for a build sprint it is important to concentrate on key features that both **_solves the initital problem and implements feedback from user testing_**.

Our current recommendations for an initial sprints would be:

* Implement feedback from user testing
* To make the product useable on larger screen sizes
* Improve accessibility - Product is currently not useable for people with hearing or visual impairments
* Back end!
* Live video stream and ability to re-take the video
  * Error handling for people with incompatible browsers (currently only works with Chrome)
* Map!
* Email function. Confirmation of application, Blue Cross and to potential re-homers
* Improve speed!

> This would be formally decided following the user testing and during a sprint planning meeting :+1:

### MVP :bulb:

Following the presentation it seems that the most appropriate form of _*"MVP"*_ would be an app specifically people who want ot **rehome their dogs using the Blue Cross service**.
Therefore leaving the communication with potential new owners to a later stage in the development.
In order to get the MVP functional we would need to:

* Have a backend! To collect the data and pass this on the BX in a useful and readable way
* Make the product able to function on all screen sizes and types
* Incorporate accessibility protocols
* Introduce error handling for when things go wrong or users don't input the correct data
* Live video stream and ability to re-take the video/photos
* A page for the current owner to review their profile and recieve confirmation of their application
* Any feedback that comes up in user testing!

_*This is a non-exhaustive list*_

:sparkles:

### Product Feedback ... :arrows_counterclockwise:

...

## Running the app

- [ ] `yarn install` or `npm i` 
- [ ] make sure you have your env file set up, see [here](https://www.npmjs.com/package/sendemail) for info about the variables you need (but you don't need to export them). You can get the config from the heroku app by running `heroku config -a bluecross` if you have the heroku cli tools installed.
- [ ] run `elm-watch` (because this contains the elm-make command)
- [ ] run frontend/backend scripts as required