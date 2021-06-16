//
//  ModuleModelDummyData.swift
//  MoEx
//
//  Created by Randy Efan Jayaputra on 14/06/21.
//

import UIKit

struct Modules {
    static var data = [
        ModuleModel(title: "Initiation Exercise", thumb: UIImage(named: "module-thumbnail")!, module_desc: "Initiation is a total body workout that recruits every major muscle group you have. It starts off feeling light and easy but the load on the muscles soon begins to pile up and you do need to dig deep in order to continue delivering great form. ", exercise: [
            Exercise(
                title: "Push Up",
                thumb: UIImage(named: "pushup")!,
                embedLink: "https://www.youtube.com/embed/rjc0O7OXS3g",
                benefits: [
                    Benefit(description: "Improved upper-body strength"),
                    Benefit(description: "Improved core strength and stability"),
                    Benefit(description: "They can double as cardio"),
                    Benefit(description: "Supports strong bones"),
                    Benefit(description: "Improves posture")
            ], equipment: nil, reps: 0, illustrations: [UIImage(named: "pushup-illustration01")!, UIImage(named: "pushup-illustration02")!], howTo: [
                HowTo(description: "Get down on all fours, placing your hands slightly wider than your shoulders."),
                HowTo(description: "Straighten your arms and legs."),
                HowTo(description: "Lower your body until your chest nearly touches the floor. "),
                HowTo(description: "Pause, then push yourself back up.  "),
                HowTo(description: "Repeat. ")
        ]),
            Exercise(
                title: "Squats",
                thumb: UIImage(named: "squat")!,
                embedLink: "https://www.youtube.com/embed/YaXPRqUwItQ",
                benefits: [
                    Benefit(description: "Get major definition in the legs and butt."),
                    Benefit(description: "Improve mobility in hips and ankles."),
                    Benefit(description: "Strengthen and tone the core."),
                    Benefit(description: "Improve posture.")
            ], equipment: nil, reps: 12, illustrations: [UIImage(named: "squat-illustration01")!, UIImage(named: "squat-illustration02")!], howTo: [
                HowTo(description: "Stand with your hands on the back of your head and your feet shoulder-width apart with your feet turned out slightly to open the hip joint."),
                HowTo(description: "Lower your body until your thighs are parallel to the floor. "),
                HowTo(description: "Pause, then return to the starting position."),
                HowTo(description: "Repeat.")
            ]),
            Exercise(
                title: "Planks",
                thumb: UIImage(named: "plank")!,
                embedLink: "https://www.youtube.com/embed/DHvSGdCIZyQ",
                benefits: [
                    Benefit(description: "Get major core definition."),
                    Benefit(description: "Reduce the risk of injury."),
                    Benefit(description: "Improve posture"),
                    Benefit(description: "Improve balance")
            ], equipment: nil, reps: 15, illustrations: [UIImage(named: "plank-illustration01")!, UIImage(named: "plank-illustration02")!], howTo: [
                HowTo(description: "Lay down on your stomach."),
                HowTo(description: "Lift your body up onto your elbows and toes. Try to maintain a straight spine, and do not let your hips or pelvis drop."),
                HowTo(description: "Hold for as long as you can. Williams says aim first for 30 seconds and then keep adding time time until you can hold for a minute.")
            ]),
            Exercise(
                title: "Lunges",
                thumb: UIImage(named: "lunges")!,
                embedLink: "https://www.youtube.com/embed/nlots37xVL8",
                benefits: [
                    Benefit(description: "Weight loss"),
                    Benefit(description: "Balance and stability"),
                    Benefit(description: "Alignment and symmetry"),
                    Benefit(description: "Stand taller")
            ], equipment: nil, reps: 10, illustrations: [UIImage(named: "lunges-illustration01")!, UIImage(named: "lunges-illustration02")!], howTo: [
                HowTo(description: "Start in a lunge position with your front knee bent and your back leg straight."),
                HowTo(description: "Bend your back knee, and lower your body until both knees form 90-degree angles."),
                HowTo(description: "Push into the ground with your forward heel and back toes as you lift your body back to the starting position."),
                HowTo(description: "Repeat 3 sets of 8 to 10 reps on each side")
            ]),
            Exercise(
                title: "Mountain Climbers",
                thumb: UIImage(named: "mountain-climber")!,
                embedLink: "https://www.youtube.com/embed/nmwgirgXLYM",
                benefits: [
                    Benefit(description: "Mountain climbers are a great way to burn body-fat."),
                    Benefit(description: "Great for building core strength and more effective and safer than two of the most popular exercises (sit-ups and crunches)"),
                    Benefit(description: "Activate the glutes"),
                    Benefit(description: "Mountain climbers are low-impact")
            ], equipment: nil, reps: 15, illustrations: [UIImage(named: "mountain-climber-illustration01")!, UIImage(named: "mountain-climber-illustration02")!], howTo: [
                HowTo(description: "Start in a plank pose, with shoulders over wrists."),
                HowTo(description: "Pull your waist in, drag shoulder blades down the back, and engage the core."),
                HowTo(description: "Fire up the belly by pulling one knee in, and then send it back. As soon your toe touches the floor, alternate and send the other knee toward the chest and back again. That's one rep."),
                HowTo(description: "Keep alternating your steps and breathing for 20 seconds, or up to 1 minute.")
            ]),
            Exercise(
                title: "Burpee",
                thumb: UIImage(named: "burpee")!,
                embedLink: "https://www.youtube.com/embed/3uFcOWz9qN8",
                benefits: [
                Benefit(description: "Burn more calories if you do burpees at a higher intensity."),
                Benefit(description: "Offers a full-body workout"),
                Benefit(description: "Boosts cardio fitness and burns fat"),
                Benefit(description: "Convenient and versatile")
            ], equipment: nil, reps: 30,
                illustrations: [
                    UIImage(named: "burpee-illustration01")!,
                    UIImage(named: "burpee-illustration01")!],
                howTo: [
                    HowTo(description: "Stand with your feet shoulder-width apart, weight in your heels, and your arms at your sides."),
                    HowTo(description: "Push your hips back, bend your knees, and lower your body into a squat."),
                    HowTo(description: "Place your hands on the floor directly in front of, and just inside, your feet. Shift your weight onto your hands."),
                    HowTo(description: "Jump your feet back to softly land on the balls of your feet in a plank position. Your body should form a straight line from your head to heels. Be careful not to let your back sag or your butt stick up in the air, as both can keep you from effectively working your core."),
                    HowTo(description: "Jump your feet back so that they land just outside of your hands"),
                    HowTo(description: "Reach your arms over head and explosively jump up into the air."),
                    HowTo(description: "Land and immediately lower back into a squat for your next rep.")
            ])
    ], time: 15, calories: 60)]
}
