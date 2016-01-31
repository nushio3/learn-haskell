module Data.Vec where

data Vec a = Vec a a a

(・) :: Vec a -> Vec a -> a
(Vec ax ay az) ・ (Vec bx by bz) = undefined

(×) :: Vec a -> Vec a -> Vec a
(Vec ax ay az) × (Vec bx by bz) = undefined
