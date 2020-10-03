---
title: 'GameCult Labor Platform'
anchors:
    active: false
tagtitle: h2
---

# Architecture

The Labor Platform is available on our website as a web app. Users can simply login using their Github account or create a GameCult account (same account used in our games). Pages and actions in this section all take place on our website, which communicates with an application and database running on our server containing code that interfaces with Github for things like the creation of issues, assignment of tasks, and retrieving patron donation history.


## Contribute

This section of the Platform is where members can view all of the currently outstanding issues for our projects, and sign up to volunteer themselves. Each entry is linked to Github, and displays its current status in the list entry, including some data which is not available on Github. Issues can be sorted and filtered based on any of the following:


### Data



*   Project
*   Name
*   Category (Modeling/Music/AI/Refactoring/etc.)
*   Status (available/assigned/pending review/complete)
*   Currently assigned members/Current volunteers
*   Man Hours
*   Skill Level
*   Contribution Points


## Vote

This section of the Platform allows members to participate in determining the future direction of GameCult. Any member can create a motion in this section or vote on existing motions.


## Profile

This section allows the user to access supplementary information and statistics connected to their account. Here the user can describe the skills they have to better match them with open issues.



*   Nickname
*   Member Tier
*   Portfolio Link
*   Skills
    *   List areas of expertise and the level for each skill.
*   Availability
    *   Amount of time per day that the user is available for work
    *   Weekday selection
*   Task History
    *   Completed Tasks
    *   Tasks in Progress
    *   Hours worked
    *   Total points earned/ total payout (per/year)
*   Payout
    *   Revenue Share
        *   Monthly/Yearly Income
        *   Total
        *   Per Project
    *   Bounties
        *   Total
        *   This Month/Year
*   Point Balance


### Management

This section is for creating motions which impact some aspect of the GameCult organization itself, such as tier thresholds or Role applications. Motions in this section are time-limited, and will pass or fail depending on the vote distribution at the end of the time limit. The majority needed to pass a motion depends on the type.


### Projects

This section is for motions which, when successful, result in the creation of a new issue with associated bounty. This is the place to report bugs in one of our projects, or suggest new features or content to be created. Motions in this section are not time-limited, and are passed when a certain proportion of the total voting body agrees on it. There are only positive votes in this section, abstaining from voting on a proposal here is the same as voting against. The proportion necessary to pass a proposal depends on its category:



*   Bugs: 15%
*   Cosmetics: 30%
*   Balance Changes: 40%
*   Features: 50%
*   New Content: 50%
*   Fundamental Design Changes: 66%


# Tiers

Members are given points according to two metrics: patrons and contributors, both of which contribute towards their ranking in a tier system. Tiers, in addition to providing certain benefits, directly determine how powerful the member’s vote is on the Platform. Each of the 5 tiers of each type provides a single vote added to the total number of votes a member can use.


### Decay

In order to avoid stratifying the organization over time due to a weight of historical contribution that is impossible for new members to overcome, historical point balances are subject to exponential decay, with 1% of their balance disappearing every week, rounded down. This does not apply to project specific contribution points.


### Patrons

Both a patron’s monthly contribution and their total historical donation counts towards their Patron Tier. After a month, a donation becomes historical, meaning its value is halved and subject to point decay. Every dollar of direct donation provides a single point. Player accounts also earn patron points for 20% of their CultCoin purchases.

**Tier I - Bronze (10 pts)**

**Tier II - Silver (100 pts)**

**Tier III - Gold (1k pts)**

**Tier IV - Platinum (10k pts)**

**Tier V - Unobtanium (100k pts)**


### Contributors

Contributors earn points from their contributions, with the amount being calculated using a formula that takes input from the task’s skill requirement and estimated man-hours. Contribution points are accounted for on both a general and per-project basis. Project contribution points do not decay. For simplicity and parity with patron points, each point granted represents a dollar of nominal labor value. Contributors are also eligible for bonuses if they turn in contributions early or if they. New contributors are automatically granted 20 contribution points for an automatic tier of Postulate.

**Tier I - Postulate (10 pts)**

**Tier II - Initiate (100 pts)**

Required to qualify for revenue sharing

**Tier III - Novice (1k pts)**

Allows the member to apply for a Maintainer Role for any project

**Tier IV - Adept (10k pts)**

Allows the member to apply for a Producer Role for any project

**Tier V - Master (100k pts)**


# Revenue Sharing

Revenue is divided in three equal portions: one portion is divided among all members according to total contribution points, one is divided according to contributions for the specific project which generated the revenue, and the last is stored in the budget for expenses and development of future projects.


# Roles

Not all contributions can be easily quantified by individual tasks. Some jobs are ongoing, and should be rewarded as such. We call those positions “Roles”. Roles provide an ongoing stream of both direct income (salary) and contribution points.


### Social Media

Describes those tasked with social media-related responsibilities. Someone in this role would be responsible for maintaining and keeping up-to-date with the various social media profiles maintained by GameCult.


### Community Manager

Community managers are responsible for maintaining contact with and order within our internal social environments, such as Discord or forums.


### Maintainer

Members of a project’s maintenance team are responsible for formalizing community proposals and reviewing pull requests to verify quality and coverage. This does not apply only to code. Projects need Maintainers to verify the quality of art as well, and there is a writing-related role (Editor) which is not project-specific.


### Producer

Producers are responsible for coordinating and caring for the members who are working on their project, as well as creating milestones and keeping their eyes on deadlines. It’s their job to choose which volunteers get assigned to issues. They can also unilaterally create new issues as long as they aren’t contradicted by previous community votes.


# Workflow


## Issue Creation

Sometimes the community has spoken, and decided that something needs to get done. When such a proposal passes, it is added to a queue for formalization. Other times it is a Producer for the project who decides, crafting a proposal and adding it to the queue directly.

From the queue, a maintainer will pick up the proposal and turn it into an Issue, describing it in detail as well as determining the skill level and man hours required to complete the task.


## Assignment

Once an issue has been created, it must be assigned to a member. Members must volunteer to work on an issue, at which point they can be chosen for the task by the project’s Producer.

The assigned member is by default assigned a nominal deadline depending on their stated availability and the amount of man-hours of the task: a person who has declared 1 hour per day of availability would receive 5 days to complete a 5 man-hour task. The default deadline can be adjusted by the Producer when the task is assigned.


## Submission

Regardless of the state of work when the deadline is reached, it must be submitted to the project repository as a pull request.

At this point one of the project’s Maintainers needs to come along and determine whether the submission solves the issue and meets the project’s standards for quality. If it does not, the Producer can choose whether to extend the deadline or reassign the task and choose what proportion of the bounty goes to the previous assignee.

On completion, the member(s) assigned to the task are awarded the contribution points and the cash bounty associated with the task. A successful task can be awarded a point bonus proportional to the nominal man-hours divided by the number taken. A highly successful task where the assignee went beyond the call of duty may also earn a bonus at the discretion of the Producer.