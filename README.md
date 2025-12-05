<h1 align="center">
    <div style="display: flex; align-items: center; justify-content: center;">
        <div style="flex: 0 0 18%; text-align: center;">
            <img src="static/assets/icon.gif" alt="Icon" style="height: 3.5em; max-width: 100%;">
        </div>
        <div style="flex: 0 0 82%; text-align: left;">
            World Models That Know When They Don't Know:
            <br /> <span style="font-size: xx-large;">Controllable Video Generation with Calibrated Uncertainty    
        </div>
    </div>
</h1>
<p align="center"> 
    <span class="author-block"><a href="https://may0mei.github.io/">Zhiting&nbsp;Mei*</a></span>,
    <span class="author-block"><a
            href="https://tenny-yinyijun.github.io/">Tenny&nbsp;Yin</a></span>,
    <span class="author-block"><a href="#">Micah&nbsp;Baker</a></span>,
    <span class="author-block"><a href="#">Ola&nbsp;Shorinwa*</a></span>,
    <span class="author-block"><a
            href="https://irom-lab.princeton.edu/majumdar/">Anirudha&nbsp;Majumdar</a></span>
                
</p>
<p align="center">
    <sup>&#42;</sup>Equal Contribution.
</p>
<p align="center">
  <!-- <a href="">
    <img src="static/assets/irom_princeton.png" width="80%">
  </a> -->
  <h4 align="center">
  <a href="https://c-cubed-uq.github.io/">Project Page</a> 
  | <a href= "#">arXiv (Coming Soon!)</a>
  <div align="center"></div>
</p>

<br>


Recent advances in generative video models have led to significant breakthroughs in high-fidelity video
synthesis,
specifically in controllable video generation where the generated video is conditioned on text and
action inputs.
This impressive leap in performance has paved the way for broad applications from instruction-guided
video editing
to world modeling in robotics.
Despite these exceptional capabilities, controllable video models often
*hallucinate* generating future video frames that are misaligned with physical
reality; which raises
serious
concerns
in many tasks such as robot policy evaluation and planning. However, state-of-the-art video models lack
the
ability to assess and express their confidence, further impeding hallucination mitigation.
To rigorously address this challenge, we propose
$C^{3}$
an uncertainty quantification method for training *continuous-scale*
*calibrated* *controllable* video models
for *dense* confidence estimation at the *subpatch* (channel) level,
precisely localizing the uncertainty
in each generated video frame. The effectiveness of our UQ method is underpinned by three core
innovations:

1. Our method introduces a novel framework that trains video models for *correctness*
and *calibration*
via strictly proper scoring rules.

2. We estimate the video model's uncertainty in latent space, avoiding training instability and
prohibitive training
costs associated with pixel-space approaches.

3. We map the dense latent-space uncertainty to *interpretable* pixel-level
uncertainty in the RGB space for
intuitive visualization, providing high-resolution uncertainty heatmaps that identify untrustworthy regions.

Through extensive experiments on large-scale robot learning datasets (Bridge and DROID) and real-world
evaluations,
we demonstrate that our method not only provides calibrated uncertainty estimates within the training
distribution,
but also enables effective out-of-distribution detection.