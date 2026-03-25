-- =============================================================================
-- CalReg Proceedings Table — Supabase Migration
-- =============================================================================

CREATE TABLE IF NOT EXISTS proceedings (
  id               uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  docket           text NOT NULL,
  section_type     text NOT NULL CHECK (section_type IN ('application','proposed_decision')),
  period_label     text NOT NULL,
  period_type      text NOT NULL CHECK (period_type IN ('current','prior','older')),
  period_sort      int  NOT NULL,
  period_id        text,
  date_label       text NOT NULL,
  utilities        text[] NOT NULL DEFAULT '{}',
  title            text NOT NULL,
  summary          text NOT NULL,
  status_text      text NOT NULL,
  status_class     text NOT NULL DEFAULT 's-ongoing',
  primary_link_url  text,
  primary_link_text text,
  docket_card_url   text,
  ai_details_html   text,
  vote_note         text,
  anchor_id         text,
  created_at        timestamptz DEFAULT now()
);

ALTER TABLE proceedings ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Public read" ON proceedings;
CREATE POLICY "Public read" ON proceedings FOR SELECT TO anon USING (true);

-- =============================================================================
-- APPLICATIONS
-- =============================================================================

-- 1. A.26-02-018 — PG&E Hamilton Branch Hydro
INSERT INTO proceedings
  (docket, section_type, period_label, period_type, period_sort, period_id, date_label, utilities, title, summary, status_text, status_class, primary_link_url, primary_link_text, docket_card_url, ai_details_html, vote_note, anchor_id)
VALUES (
  'A.26-02-018',
  'application',
  'Feb 16 – Feb 27, 2026',
  'prior',
  2,
  'apps-prior',
  'Filed Feb 27, 2026',
  ARRAY['pge'],
  'PG&E — Sale of Hamilton Branch Hydroelectric Project',
  'PG&E seeks §851 approval to sell the 4.8 MW mothballed Hamilton Branch Hydroelectric Project near Lake Almanor to Hamilton Branch Hydro, LLC.',
  'Application',
  's-ongoing',
  'https://docs.cpuc.ca.gov/PublishedDocs/Efile/G000/M601/K158/601158397.PDF',
  'View Application',
  'https://apps.cpuc.ca.gov/apex/f?p=401:56:0::NO:RP,57,RIR:P5_PROCEEDING_SELECT:A2602018',
  '<em>PG&amp;E</em> seeks CPUC authorization under PUC §851 to sell the <em>Hamilton Branch Hydroelectric Project</em> — a <strong>4.8 MW</strong> facility mothballed as uneconomical. The buyer is <em>Hamilton Branch Hydro, LLC</em>. The Commission must determine whether the sale is in the public interest and that ratepayers receive appropriate benefit from any gain on sale.<br>Purchase price not publicly disclosed in the application. Ratebase impact and disposition of proceeds addressed in financial exhibits. Transaction also requires FERC approval for jurisdictional assets. The <em>Feather River Land Trust</em> conservation easement remains in place regardless of outcome.',
  NULL,
  NULL
);

-- 2. A.26-02-019 — PG&E 2025 UOG Compliance Review
INSERT INTO proceedings
  (docket, section_type, period_label, period_type, period_sort, period_id, date_label, utilities, title, summary, status_text, status_class, primary_link_url, primary_link_text, docket_card_url, ai_details_html, vote_note, anchor_id)
VALUES (
  'A.26-02-019',
  'application',
  'Feb 16 – Feb 27, 2026',
  'prior',
  2,
  'apps-prior',
  'Filed Feb 27, 2026',
  ARRAY['pge'],
  'PG&E — 2025 Utility Owned Generation Compliance Review',
  'PG&E''s annual UOG compliance review for 2025 — covers PABA capital costs and ERRA fuel/variable O&M; Diablo Canyon exclusion contested.',
  'Application',
  's-ongoing',
  'https://docs.cpuc.ca.gov/PublishedDocs/Efile/G000/M601/K158/601158608.PDF',
  'View Application',
  'https://apps.cpuc.ca.gov/apex/f?p=401:56:0::NO:RP,57,RIR:P5_PROCEEDING_SELECT:A2602019',
  'Annual §451/§454.5 compliance review of <em>PG&amp;E</em>''s utility-owned generation (UOG) fleet for 2025. The Commission must determine whether <em>PG&amp;E</em>''s generation operations, economic dispatch, fuel procurement, and contract administration were prudent and consistent with its approved procurement plan. <em>PG&amp;E</em> argues <em>Diablo Canyon Power Plant</em> (DCPP) extended operations costs belong in a separate statutory proceeding and should not be reviewed here.<br>The <em>Portfolio Allocation Balancing Account</em> (PABA) tracks capital costs; the <em>Energy Resource Recovery Account</em> (ERRA) tracks fuel and variable O&amp;M costs. Commission findings on prudency determine whether recorded costs are recoverable in rates or subject to disallowance.',
  NULL,
  NULL
);

-- 3. A.26-02-020 — Crimson California Pipeline Rate Increase
INSERT INTO proceedings
  (docket, section_type, period_label, period_type, period_sort, period_id, date_label, utilities, title, summary, status_text, status_class, primary_link_url, primary_link_text, docket_card_url, ai_details_html, vote_note, anchor_id)
VALUES (
  'A.26-02-020',
  'application',
  'Feb 16 – Feb 27, 2026',
  'prior',
  2,
  'apps-prior',
  'Filed Feb 27, 2026',
  ARRAY['others'],
  'Crimson California Pipeline — Crude Oil Pipeline Rate Increase (66.97%)',
  'Crimson California Pipeline seeks a 66.97% crude oil transport rate increase effective April 1, citing declining throughput as California refineries reduce operations.',
  'Application',
  's-ongoing',
  'https://docs.cpuc.ca.gov/PublishedDocs/Efile/G000/M601/K158/601158735.PDF',
  'View Application',
  'https://apps.cpuc.ca.gov/apex/f?p=401:56:0::NO:RP,57,RIR:P5_PROCEEDING_SELECT:A2602020',
  '<em>Crimson California Pipeline</em>, a crude oil common carrier regulated by the CPUC, seeks a <strong>66.97%</strong> rate increase effective April 1, 2026. The company cites a steep decline in throughput as California refineries reduce crude intake, leaving fixed costs spread across lower volumes. The Commission must determine whether the proposed rate is just and reasonable under PUC §454. Shippers and downstream parties may intervene. No IOU ratepayer exposure — crude oil shipper costs not passed through to residential utility bills.',
  NULL,
  NULL
);

-- 4. A.26-02-021 — PacifiCorp Wildfire Expense Memorandum Account
INSERT INTO proceedings
  (docket, section_type, period_label, period_type, period_sort, period_id, date_label, utilities, title, summary, status_text, status_class, primary_link_url, primary_link_text, docket_card_url, ai_details_html, vote_note, anchor_id)
VALUES (
  'A.26-02-021',
  'application',
  'Feb 16 – Feb 27, 2026',
  'prior',
  2,
  'apps-prior',
  'Filed Feb 27, 2026',
  ARRAY['others'],
  'PacifiCorp — Wildfire Expense Memorandum Account Recovery (~$1.7B multistate)',
  'PacifiCorp seeks rate recovery for California-allocated wildfire costs from the 2020 Slater Fire and 2022 McKinney Fire via its Wildfire Expense Memorandum Account.',
  'Application',
  's-ongoing',
  'https://docs.cpuc.ca.gov/PublishedDocs/Efile/G000/M601/K158/601158276.PDF',
  'View Application',
  'https://apps.cpuc.ca.gov/apex/f?p=401:56:0::NO:RP,57,RIR:P5_PROCEEDING_SELECT:A2602021',
  '<em>PacifiCorp</em> (d/b/a Pacific Power) seeks CPUC authorization to recover wildfire-related costs recorded in its Wildfire Expense Memorandum Account (WEMA) for the 2020 Slater Fire and 2022 McKinney Fire. The ~<strong>$1.7B</strong> total is multistate; California''s jurisdictional share is subject to CPUC review. The Commission must determine whether recorded costs were prudently incurred before authorizing rate recovery. Intervenor review of fire cause, cost allocation methodology, and insurance offsets is expected.',
  NULL,
  NULL
);

-- 5. A.26-02-007 — Southwest Gas Debt Securities
INSERT INTO proceedings
  (docket, section_type, period_label, period_type, period_sort, period_id, date_label, utilities, title, summary, status_text, status_class, primary_link_url, primary_link_text, docket_card_url, ai_details_html, vote_note, anchor_id)
VALUES (
  'A.26-02-007',
  'application',
  'Feb 2 – Feb 13, 2026',
  'older',
  3,
  'apps-older',
  'Filed Feb 12, 2026',
  ARRAY['swg'],
  'Southwest Gas — $1.15 Billion Debt Securities Authorization',
  'Southwest Gas seeks CPUC authority to issue up to $1.15 billion in new debt securities and refinance existing obligations.',
  'Application',
  's-ongoing',
  'https://www.cpuc.ca.gov/PublishedDocs/Efile/G000/M599/K152/599152713.PDF',
  'View Application',
  'https://apps.cpuc.ca.gov/apex/f?p=401:56:0::NO:RP,57,RIR:P5_PROCEEDING_SELECT:A2602007',
  '<em>Southwest Gas</em> seeks CPUC authorization under PUC §817 to issue up to <strong>$1.15 billion</strong> in long-term debt securities — including notes, debentures, and other obligations — over a multi-year period. Proceeds fund capital improvements to its California gas distribution system, refinance maturing obligations, and meet general corporate purposes. The Commission reviews whether the issuance is reasonably necessary for lawful corporate purposes and that the terms do not impair utility service or ratepayer interests.',
  NULL,
  NULL
);

-- 6. A.26-01-007 — SCE Woolsey Fire Bond Securitization
INSERT INTO proceedings
  (docket, section_type, period_label, period_type, period_sort, period_id, date_label, utilities, title, summary, status_text, status_class, primary_link_url, primary_link_text, docket_card_url, ai_details_html, vote_note, anchor_id)
VALUES (
  'A.26-01-007',
  'application',
  'Jan 19 – Jan 30, 2026',
  'older',
  4,
  'apps-jan1930',
  'Filed Jan 14, 2026',
  ARRAY['sce'],
  'SCE — Woolsey Fire Bond Securitization ($1.84B)',
  'SCE seeks CPUC authorization to issue $1.84 billion in rate reduction bonds to securitize Woolsey Fire costs, lowering the financing cost to ratepayers versus traditional recovery.',
  'Application',
  's-ongoing',
  'https://docs.cpuc.ca.gov/PublishedDocs/Efile/G000/M595/K201/595201125.PDF',
  'View Application',
  'https://apps.cpuc.ca.gov/apex/f?p=401:56:0::NO:RP,57,RIR:P5_PROCEEDING_SELECT:A2601007',
  '<em>SCE</em> seeks a CPUC financing order under AB 1054 authorizing <strong>$1.84 billion</strong> in rate reduction bonds to securitize its approved Woolsey Fire wildfire costs. Securitization replaces traditional rate base recovery with lower-cost bond financing — saving ratepayers an estimated hundreds of millions in carrying costs over the recovery period. Bondholders are repaid through a non-bypassable charge on customer bills. The CPUC must find the structure is in the public interest and issue a financing order before bonds can be sold.',
  NULL,
  NULL
);

-- 7. A.26-01-010 — SDG&E ESA/CARE 2028–2033
INSERT INTO proceedings
  (docket, section_type, period_label, period_type, period_sort, period_id, date_label, utilities, title, summary, status_text, status_class, primary_link_url, primary_link_text, docket_card_url, ai_details_html, vote_note, anchor_id)
VALUES (
  'A.26-01-010',
  'application',
  'Jan 19 – Jan 30, 2026',
  'older',
  4,
  'apps-jan1930',
  'Filed Jan 16, 2026',
  ARRAY['sdge'],
  'SDG&E — ESA/CARE Low-Income Program Authorization 2028–2033',
  'SDG&E seeks authority to continue and expand its Energy Savings Assistance (ESA) and CARE low-income programs for the 2028–2033 program cycle.',
  'Application',
  's-ongoing',
  'https://www.cpuc.ca.gov/PublishedDocs/Efile/G000/M595/K083/595083718.PDF',
  'View Application',
  'https://apps.cpuc.ca.gov/apex/f?p=401:56:0::NO:RP,57,RIR:P5_PROCEEDING_SELECT:A2601010',
  '<em>SDG&amp;E</em> files its Low-Income Proceedings Application for the 2028–2033 cycle, covering both the <em>Energy Savings Assistance</em> (ESA) program — which provides free weatherization and appliance upgrades to income-qualified customers — and the <em>California Alternate Rates for Energy</em> (CARE) discount program. SDG&amp;E proposes program budgets, customer targets, and delivery methods for Commission approval. Filed in coordination with the parallel SoCalGas (A.26-01-011) and joint IOU bridge (A.26-01-021) applications.',
  NULL,
  NULL
);

-- 8. A.26-01-011 — SoCalGas ESA/CARE 2028–2033
INSERT INTO proceedings
  (docket, section_type, period_label, period_type, period_sort, period_id, date_label, utilities, title, summary, status_text, status_class, primary_link_url, primary_link_text, docket_card_url, ai_details_html, vote_note, anchor_id)
VALUES (
  'A.26-01-011',
  'application',
  'Jan 19 – Jan 30, 2026',
  'older',
  4,
  'apps-jan1930',
  'Filed Jan 16, 2026',
  ARRAY['scg'],
  'SoCalGas — ESA/CARE Low-Income Program Authorization 2028–2033',
  'SoCalGas seeks authority to continue its ESA and CARE program offerings for the 2028–2033 cycle, in coordination with the parallel SDG&E filing.',
  'Application',
  's-ongoing',
  'https://docs.cpuc.ca.gov/PublishedDocs/Efile/G000/M595/K320/595320885.PDF',
  'View Application',
  'https://apps.cpuc.ca.gov/apex/f?p=401:56:0::NO:RP,57,RIR:P5_PROCEEDING_SELECT:A2601011',
  '<em>SoCalGas</em> seeks CPUC approval to continue delivering the <em>Energy Savings Assistance</em> (ESA) and <em>CARE</em> low-income programs across its gas service territory for the 2028–2033 cycle. ESA provides weatherization measures and appliance replacements to reduce energy burden for low-income customers; CARE provides a rate discount. SoCalGas proposes program structure, budgets, and outreach targets. Filed concurrently with SDG&amp;E''s application (A.26-01-010) and the joint IOU bridge filing (A.26-01-021).',
  NULL,
  NULL
);

-- 9. A.26-01-021 — Joint IOUs ESA/CARE Bridge PY2027
INSERT INTO proceedings
  (docket, section_type, period_label, period_type, period_sort, period_id, date_label, utilities, title, summary, status_text, status_class, primary_link_url, primary_link_text, docket_card_url, ai_details_html, vote_note, anchor_id)
VALUES (
  'A.26-01-021',
  'application',
  'Jan 19 – Jan 30, 2026',
  'older',
  4,
  'apps-jan1930',
  'Filed Jan 29, 2026',
  ARRAY['pge','sce','sdge','scg','swg'],
  'Joint IOUs — ESA/CARE Bridge Program Year 2027',
  'All five major California IOUs jointly seek a one-year bridge authorization for ESA/CARE low-income programs in Program Year 2027 while the 2028–2033 cycle applications are pending.',
  'Application',
  's-ongoing',
  'https://www.cpuc.ca.gov/PublishedDocs/Efile/G000/M596/K907/596907841.PDF',
  'View Application',
  'https://apps.cpuc.ca.gov/apex/f?p=401:56:0::NO:RP,57,RIR:P5_PROCEEDING_SELECT:A2601021',
  'All five major California IOUs — <em>PG&amp;E, SCE, SDG&amp;E, SoCalGas, and Southwest Gas</em> — jointly seek a one-year bridge authorization to continue ESA and CARE low-income programs in Program Year 2027. The bridge is necessary because the long-term 2028–2033 cycle applications (filed separately) will not be resolved before PY2027 begins, creating a gap in program authority. Without Commission approval, IOUs would lack authorization to operate and fund the programs during 2027 — potentially interrupting service to hundreds of thousands of low-income customers.',
  NULL,
  NULL
);

-- 10. A.26-01-004 — Brookfield Wild Goose & Lodi Gas Storage
INSERT INTO proceedings
  (docket, section_type, period_label, period_type, period_sort, period_id, date_label, utilities, title, summary, status_text, status_class, primary_link_url, primary_link_text, docket_card_url, ai_details_html, vote_note, anchor_id)
VALUES (
  'A.26-01-004',
  'application',
  'Jan 19 – Jan 30, 2026',
  'older',
  4,
  'apps-jan1930',
  'Filed Jan 12, 2026',
  ARRAY['others'],
  'Brookfield Infrastructure — Wild Goose & Lodi Gas Storage Acquisition',
  'Brookfield Infrastructure seeks §851 approval to acquire the Wild Goose and Lodi natural gas storage facilities — key storage assets serving the Northern California gas market.',
  'Application',
  's-ongoing',
  'https://www.cpuc.ca.gov/PublishedDocs/Efile/G000/M594/K365/594365127.PDF',
  'View Application',
  'https://apps.cpuc.ca.gov/apex/f?p=401:56:0::NO:RP,57,RIR:P5_PROCEEDING_SELECT:A2601004',
  '<em>Brookfield Infrastructure Partners</em> seeks CPUC authorization under PUC §851 to acquire <em>Wild Goose Energy Storage</em> (~28 Bcf working capacity) and <em>Lodi Gas Storage</em> (~12 Bcf) — two major Northern California gas storage facilities currently owned by a PG&amp;E affiliate. Together they represent critical seasonal storage capacity for the regional gas market. The Commission must find the transfer consistent with the public interest, including operational continuity, reliability, and ratepayer protection. FERC approval also required for FERC-jurisdictional assets.',
  NULL,
  NULL
);

-- =============================================================================
-- PROPOSED DECISIONS
-- =============================================================================

-- 11. A.24-03-009 — PG&E Transmission Lease Citizens Energy
INSERT INTO proceedings
  (docket, section_type, period_label, period_type, period_sort, period_id, date_label, utilities, title, summary, status_text, status_class, primary_link_url, primary_link_text, docket_card_url, ai_details_html, vote_note, anchor_id)
VALUES (
  'A.24-03-009',
  'proposed_decision',
  'Mar 2 – Mar 13, 2026',
  'current',
  1,
  NULL,
  'PD Released Mar 6, 2026',
  ARRAY['pge'],
  'PG&E — Leasing Transmission Entitlements to Citizens Energy Corp.',
  'PG&E seeks §851 approval to lease transmission entitlements to Citizens Energy Corp. under five 30-year agreements worth up to $1 billion.',
  'Proposed Decision',
  's-ongoing',
  'https://docs.cpuc.ca.gov/PublishedDocs/Efile/G000/M601/K795/601795585.PDF',
  'View PD',
  'https://apps.cpuc.ca.gov/apex/f?p=401:56:0::NO:RP,57,RIR:P5_PROCEEDING_SELECT:A2403009',
  '<em>PG&amp;E</em> seeks authority under Public Utilities Code §851 to lease transmission entitlements to <em>Citizens Energy</em> — a nonprofit — through up to five 30-year leases. <em>Citizens Energy</em> would fund grid upgrades (safety, reliability, capacity) in exchange. The Commission must determine whether the arrangement satisfies §851 public interest requirements. Proposed Decision issued by <em>ALJ Jack Chang</em>.<br>Total investment up to <strong>$1 billion</strong> across five leases. <em>Citizens Energy</em> commits to directing <strong>50%</strong> of net after-tax profits to clean energy for low-income communities in Central and Northern California, rising to <strong>90%</strong> over time. Comments due <strong>March 26, 2026</strong>.',
  NULL,
  NULL
);

-- 12. A.24-04-001 — SCE 2023 ERRA Compliance
INSERT INTO proceedings
  (docket, section_type, period_label, period_type, period_sort, period_id, date_label, utilities, title, summary, status_text, status_class, primary_link_url, primary_link_text, docket_card_url, ai_details_html, vote_note, anchor_id)
VALUES (
  'A.24-04-001',
  'proposed_decision',
  'Mar 2 – Mar 13, 2026',
  'current',
  1,
  NULL,
  'PD Released Mar 6, 2026',
  ARRAY['sce'],
  'SCE — 2023 Energy Resource Recovery Account (ERRA) Compliance',
  'SCE''s 2023 ERRA compliance — PD identifies a $63.2 million decrease in revenue requirement, flowing to customers as a net rate reduction.',
  'Proposed Decision',
  's-ongoing',
  'https://docs.cpuc.ca.gov/PublishedDocs/Efile/G000/M601/K846/601846486.PDF',
  'View PD',
  'https://apps.cpuc.ca.gov/apex/f?p=401:56:0::NO:RP,57,RIR:P5_PROCEEDING_SELECT:A2404001',
  '<em>SCE</em>''s annual ERRA compliance filing for 2023 — the Commission reviews whether procurement was reasonable and consistent with its approved plan. The ERRA mechanism ensures customers pay only for prudent energy costs; overcollections flow back as rate reductions. Proposed Decision issued by <em>ALJ Jeffrey Lee</em>.<br>The PD addresses a <strong>$63.195 million decrease</strong> in revenue requirement across seven accounts — customers receive a net rate reduction reflecting an overcollection in 2023. Comments due <strong>March 26, 2026</strong>.',
  NULL,
  NULL
);

-- 13. R.13-02-008 — Renewable Gas Standard Biomethane
INSERT INTO proceedings
  (docket, section_type, period_label, period_type, period_sort, period_id, date_label, utilities, title, summary, status_text, status_class, primary_link_url, primary_link_text, docket_card_url, ai_details_html, vote_note, anchor_id)
VALUES (
  'R.13-02-008',
  'proposed_decision',
  'Mar 2 – Mar 13, 2026',
  'current',
  1,
  NULL,
  'PD Released Mar 6, 2026',
  ARRAY['pge','scg','sdge','swg'],
  'Renewable Gas Standard — Biomethane Procurement Plan Modifications',
  'Modifies Renewable Gas Standard procurement targets for PG&E, SoCalGas, SDG&E, and Southwest Gas — specifying RNG volumes from dairy, landfill, and waste sources.',
  'Proposed Decision',
  's-ongoing',
  'https://docs.cpuc.ca.gov/PublishedDocs/Efile/G000/M601/K846/601846485.PDF',
  'View PD',
  'https://apps.cpuc.ca.gov/apex/f?p=401:56:0::NO:RP,57,RIR:P5_PROCEEDING_SELECT:R1302008',
  'The <em>Renewable Gas Standard</em> requires California''s four large gas utilities to procure biomethane from dairy operations, municipal solid waste, and wastewater treatment facilities. This PD updates procurement targets and modifies pipeline interconnection requirements to reflect California''s gas transition strategy and SLCP reduction goals.<br>No direct rate increase in this decision — changes to procurement volumes and interconnection requirements will affect future utility costs reflected in rates. Utilities — <em>PG&amp;E</em>, <em>SoCalGas</em>, <em>SDG&amp;E</em>, <em>Southwest Gas</em> — may face higher costs if RNG supply constraints persist. Comments due <strong>March 26, 2026</strong>.',
  NULL,
  NULL
);

-- 14. R.25-07-013 — California Climate Credit Pause
INSERT INTO proceedings
  (docket, section_type, period_label, period_type, period_sort, period_id, date_label, utilities, title, summary, status_text, status_class, primary_link_url, primary_link_text, docket_card_url, ai_details_html, vote_note, anchor_id)
VALUES (
  'R.25-07-013',
  'proposed_decision',
  'Mar 2 – Mar 13, 2026',
  'current',
  1,
  NULL,
  'Comments closed Mar 9, 2026',
  ARRAY['pge','sce','sdge','scg'],
  'California Climate Credit — Proposed Pause of 2026 Residential Electric Credit',
  'Proposes pausing the spring 2026 residential electric California Climate Credit — funded by cap-and-trade auction proceeds — to evaluate shifting it to summer when bills peak.',
  'Proposed Decision',
  's-ongoing',
  'https://docs.cpuc.ca.gov/PublishedDocs/Efile/G000/M598/K101/598101732.PDF',
  'View PD',
  'https://apps.cpuc.ca.gov/apex/f?p=401:56:0::NO:RP,57,RIR:P5_PROCEEDING_SELECT:R2507013',
  'The Commission is reconsidering the timing of the <em>California Climate Credit</em> — a bill credit derived from cap-and-trade auction proceeds. The PD pauses the spring 2026 distribution for residential electric customers to evaluate shifting it to summer, when electricity bills are highest. Phase 1A; final credit structure to be determined.<br>Since 2014, over <strong>$16 billion</strong> distributed through the <em>Climate Credit</em> mechanism across eight California utilities. The pause affects timing only — not the total amount. Expected on the <strong>March 19, 2026</strong> voting meeting agenda.',
  'Vote: Mar 19 ↗',
  'proc-r2507013'
);

-- 15. R.25-06-019 — IRP 6,000 MW Procurement Order (Adopted)
INSERT INTO proceedings
  (docket, section_type, period_label, period_type, period_sort, period_id, date_label, utilities, title, summary, status_text, status_class, primary_link_url, primary_link_text, docket_card_url, ai_details_html, vote_note, anchor_id)
VALUES (
  'R.25-06-019',
  'proposed_decision',
  'Mar 2 – Mar 13, 2026',
  'current',
  1,
  NULL,
  'Adopted Feb 26, 2026',
  ARRAY['pge','sce','sdge','scg','swg'],
  'IRP — 6,000 MW Clean Energy & Storage Procurement Order',
  'Orders all California LSEs to procure 6,000 MW of non-GHG-emitting capacity by 2030–2032; SCE 2,088 MW · PG&E 1,077 MW · CCAs share the remainder.',
  'Adopted — Unanimous',
  's-settled',
  'https://docs.cpuc.ca.gov/PublishedDocs/Published/G000/M601/K777/601777006.PDF',
  'View Decision (D-26-02-057)',
  'https://apps.cpuc.ca.gov/apex/f?p=401:56:0::NO:RP,57,RIR:P5_PROCEEDING_SELECT:R2506019',
  'President <em>Alice Reynolds</em>'' final act. Requires all California load-serving entities — IOUs, CCAs, and ESPs — to procure <strong>6,000 MW</strong> of new non-GHG-emitting capacity across three equal tranches. Each tranche: no more than <strong>50%</strong> battery storage; at least <strong>25%</strong> must be long-duration (≥8 hours) or clean firm. Adopted unanimously <strong>5–0</strong>.<br>No revenue requirement set in this decision — it is a procurement mandate, not a ratesetting order. LSE obligations: <em>SCE</em> <strong>2,088 MW</strong> · <em>PG&amp;E</em> <strong>1,077 MW</strong> · CCAs allocated the remainder. Costs flow into future GRC proceedings as contracts execute. Tranche 1 NQC deadline: <strong>December 31, 2030</strong>.',
  NULL,
  'proc-r2506019'
);

-- 16. I.23-03-008 — Gas Price Spike Investigation (Adopted, Current Period)
INSERT INTO proceedings
  (docket, section_type, period_label, period_type, period_sort, period_id, date_label, utilities, title, summary, status_text, status_class, primary_link_url, primary_link_text, docket_card_url, ai_details_html, vote_note, anchor_id)
VALUES (
  'I.23-03-008',
  'proposed_decision',
  'Mar 2 – Mar 13, 2026',
  'current',
  1,
  NULL,
  'Adopted Feb 26, 2026',
  ARRAY['pge','scg','sdge'],
  'Winter 2022–23 Natural Gas Price Spike Investigation — No Misconduct Found',
  'No misconduct found in the winter 2022–23 gas spike; PG&E, SoCalGas, and storage providers exonerated — Core Procurement Charge cap adopted as forward-looking remedy.',
  'Adopted 4–0 · Closed',
  's-settled',
  'https://docs.cpuc.ca.gov/PublishedDocs/Published/G000/M601/K862/601862088.PDF',
  'View Decision (D-26-02-058)',
  'https://apps.cpuc.ca.gov/apex/f?p=401:56:0::NO:RP,57,RIR:P5_PROCEEDING_SELECT:I2303008',
  'Opened March 2023 following the winter 2022–23 gas spike — some <em>SoCalGas</em> customers received bills exceeding <strong>$400</strong> in January 2023. The Commission investigated whether <em>PG&amp;E</em>, <em>SoCalGas</em>, <em>SDG&amp;E</em>, and independent storage operators engaged in market manipulation, withholding, or imprudent procurement. After nearly three years, the Commission closed the investigation with no finding of misconduct, attributing the spike to coincident demand peaks and pipeline constraints outside California.<br><strong>No penalties, fines, or refund orders</strong> against any utility. Prospective remedy: <em>Core Procurement Charge</em> (CPC) cap triggered when monthly core procurement price exceeds <strong>150% of the 10-year average</strong> (November–March window). Undercollections amortized — not borne by shareholders. Net rate impact: modest, structural only.',
  NULL,
  NULL
);

-- 17. A.09-09-022 — SCE Alberhill Transmission CPCN
INSERT INTO proceedings
  (docket, section_type, period_label, period_type, period_sort, period_id, date_label, utilities, title, summary, status_text, status_class, primary_link_url, primary_link_text, docket_card_url, ai_details_html, vote_note, anchor_id)
VALUES (
  'A.09-09-022',
  'proposed_decision',
  'Feb 2 – Feb 13, 2026',
  'older',
  3,
  'week-feb16',
  'PD Issued Feb 13, 2026',
  ARRAY['sce'],
  'SCE — Alberhill System Project CPCN (Riverside County Transmission)',
  'SCE''s 16-year Alberhill Transmission CPCN reaches proposed decision; capital cost cap set at $481.7 million (2023 constant dollars).',
  'Proposed Decision',
  's-ongoing',
  'https://docs.cpuc.ca.gov/PublishedDocs/Efile/G000/M599/K038/599038893.PDF',
  'View PD',
  'https://apps.cpuc.ca.gov/apex/f?p=401:56:0::NO:RP,57,RIR:P5_PROCEEDING_SELECT:A0909022',
  '<em>SCE</em> filed this application in September 2009 to build the <em>Alberhill System Project</em> — transmission lines and substations in western Riverside County to meet load growth in the Inland Empire. The project faced years of environmental review, community opposition, and route modification. The ALJ''s proposed decision resolves final scope and authorizes <em>SCE</em> to proceed with the modified route.<br>Capital cost cap: <strong>$481,700,000 (2023 constant dollars)</strong>, including a <strong>15% contingency of $53,800,000</strong>. Costs recovered through <em>SCE</em>''s FERC-regulated transmission rate base — borne by all SCE ratepayers through transmission charges. CPCN is granted; proceeding closes upon adoption.',
  'Vote: Mar 19 ↗',
  NULL
);

-- 18. A.24-06-001 — SDG&E 2023 ERRA Compliance
INSERT INTO proceedings
  (docket, section_type, period_label, period_type, period_sort, period_id, date_label, utilities, title, summary, status_text, status_class, primary_link_url, primary_link_text, docket_card_url, ai_details_html, vote_note, anchor_id)
VALUES (
  'A.24-06-001',
  'proposed_decision',
  'Feb 2 – Feb 13, 2026',
  'older',
  3,
  'week-feb16',
  'PD Issued Feb 13, 2026',
  ARRAY['sdge'],
  'SDG&E — 2023 Energy Resource Recovery Account (ERRA) Compliance',
  'SDG&E''s 2023 ERRA shows a net undercollection of $214.6 million — to be recovered from customers through future rates.',
  'Proposed Decision',
  's-ongoing',
  'https://docs.cpuc.ca.gov/PublishedDocs/Efile/G000/M599/K038/599038878.PDF',
  'View PD',
  'https://apps.cpuc.ca.gov/apex/f?p=401:56:0::NO:RP,57,RIR:P5_PROCEEDING_SELECT:A2406001',
  'Annual §451/§454.5 ERRA compliance proceeding for <em>SDG&amp;E</em>''s 2023 energy procurement year. The Commission reviews whether <em>SDG&amp;E</em>''s dispatch decisions, market purchases, and contract administration were prudent and consistent with its approved plan. Parallels the <em>SCE</em> ERRA (A.24-04-001) and <em>PG&amp;E</em> UOG review (A.26-02-019) for the same compliance year.<br><em>SDG&amp;E</em>''s 2023 procurement resulted in a <strong>net undercollection of $214,580,000</strong> (gross undercollection $224,433,000, offset by $9,853,000 overcollection in two accounts). Undercollection will be <strong>recovered through future customer rates</strong>. Decision approved with modifications including updated RA portfolio valuation, corrected RPS accounting, and battery storage revenue reallocation.',
  NULL,
  NULL
);

-- 19. A.25-06-012 — SoCalGas GCIM Year 31
INSERT INTO proceedings
  (docket, section_type, period_label, period_type, period_sort, period_id, date_label, utilities, title, summary, status_text, status_class, primary_link_url, primary_link_text, docket_card_url, ai_details_html, vote_note, anchor_id)
VALUES (
  'A.25-06-012',
  'proposed_decision',
  'Feb 2 – Feb 13, 2026',
  'older',
  3,
  'week-feb16',
  'PD Issued Feb 13, 2026',
  ARRAY['scg'],
  'SoCalGas — Gas Cost Incentive Mechanism (GCIM) Year 31 Shareholder Award',
  'SoCalGas earns a $8.37 million shareholder award under GCIM Year 31 — procurement came in $42.1 million below benchmark, with most savings flowing to ratepayers.',
  'Proposed Decision',
  's-ongoing',
  'https://docs.cpuc.ca.gov/PublishedDocs/Efile/G000/M599/K024/599024344.PDF',
  'View PD',
  'https://apps.cpuc.ca.gov/apex/f?p=401:56:0::NO:RP,57,RIR:P5_PROCEEDING_SELECT:A2506012',
  'The <em>Gas Cost Incentive Mechanism</em> (GCIM) is <em>SoCalGas</em>''s procurement performance incentive, in place since the mid-1990s. Each year the CPUC reviews whether <em>SoCalGas</em> beat or missed its benchmark procurement cost. A positive result triggers a shareholder reward; a negative result triggers a shareholder penalty. The mechanism aligns utility incentives with ratepayer interests in keeping gas costs low.<br><strong>Shareholder reward: $8,374,056</strong> for GCIM Year 31 (2024–2025 gas year). <em>SoCalGas</em>''s recorded procurement costs were <strong>$42,142,370 below benchmark</strong>, of which <strong>$33,768,315 flows to ratepayers</strong> as lower gas costs and <strong>$8,374,056</strong> goes to shareholders. Customers save roughly <strong>$4 for every $1</strong> awarded to shareholders.',
  NULL,
  NULL
);

-- 20. A.25-06-007 — SCE Debt & Preferred Equity Authorization
INSERT INTO proceedings
  (docket, section_type, period_label, period_type, period_sort, period_id, date_label, utilities, title, summary, status_text, status_class, primary_link_url, primary_link_text, docket_card_url, ai_details_html, vote_note, anchor_id)
VALUES (
  'A.25-06-007',
  'proposed_decision',
  'Feb 2 – Feb 13, 2026',
  'older',
  3,
  'week-feb16',
  'PD Issued Feb 12, 2026',
  ARRAY['sce'],
  'SCE — $9.85B Debt & $1.155B Preferred Equity Authorization',
  'SCE receives authorization for up to $9.85 billion in long-term debt and $1.155 billion in preferred equity for capital programs.',
  'Proposed Decision',
  's-ongoing',
  'https://docs.cpuc.ca.gov/PublishedDocs/Efile/G000/M599/K037/599037460.PDF',
  'View PD',
  'https://apps.cpuc.ca.gov/apex/f?p=401:56:0::NO:RP,57,RIR:P5_PROCEEDING_SELECT:A2506007',
  'Utilities seek CPUC authority to issue debt and equity in advance of actual issuances, allowing them to move quickly when capital market conditions are favorable. This authorization covers <em>SCE</em>''s anticipated capital needs driven by its wildfire mitigation capital program (WMCE), infrastructure replacement, and clean energy integration.<br>Authorized: <strong>$9,850,000,000</strong> in long-term debt (<em>SCE</em> requested $10,125,000,000 — reduced by <strong>$275,000,000</strong>) and <strong>$1,155,000,000</strong> in preferred equity (reduced by <strong>$250,000,000</strong>). Actual issuances within this cap do not require additional CPUC approval. Cost recovery occurs as capital is deployed and included in future GRC proceedings.',
  NULL,
  NULL
);

-- 21. A.24-04-017 — LS Power Santa Clara Valley Transmission CPCN
INSERT INTO proceedings
  (docket, section_type, period_label, period_type, period_sort, period_id, date_label, utilities, title, summary, status_text, status_class, primary_link_url, primary_link_text, docket_card_url, ai_details_html, vote_note, anchor_id)
VALUES (
  'A.24-04-017',
  'proposed_decision',
  'Feb 2 – Feb 13, 2026',
  'older',
  3,
  'week-feb16',
  'PD Issued Feb 13, 2026',
  ARRAY['others'],
  'LS Power Grid California — Santa Clara Valley Transmission CPCN ($1.593B cap)',
  'LS Power seeks CPCN for a $1.593 billion HVDC line in Santa Clara County, primarily to serve data center load growth in San Jose.',
  'Proposed Decision',
  's-ongoing',
  'https://docs.cpuc.ca.gov/PublishedDocs/Efile/G000/M599/K056/599056564.PDF',
  'View PD',
  'https://apps.cpuc.ca.gov/apex/f?p=401:56:0::NO:RP,57,RIR:P5_PROCEEDING_SELECT:A2404017',
  NULL,
  'Vote: Mar 19 ↗',
  'proc-a2404017'
);

-- 22. R.19-10-005 — EPIC Phase 4 Strategic Objectives
INSERT INTO proceedings
  (docket, section_type, period_label, period_type, period_sort, period_id, date_label, utilities, title, summary, status_text, status_class, primary_link_url, primary_link_text, docket_card_url, ai_details_html, vote_note, anchor_id)
VALUES (
  'R.19-10-005',
  'proposed_decision',
  'Jan 19 – Jan 30, 2026',
  'older',
  4,
  'pd-jan1930',
  'PD Released Jan 23, 2026',
  ARRAY['pge','sce','sdge'],
  'EPIC Phase 4 — Strategic Objectives & Triennial Investment Plan PD',
  'Proposes the Electric Program Investment Charge (EPIC) Phase 4 triennial plan, updating strategic objectives for clean energy R&D and technology deployment by PG&E, SCE, and SDG&E.',
  'Proposed Decision',
  's-ongoing',
  'https://docs.cpuc.ca.gov/PublishedDocs/Efile/G000/M595/K495/595495688.PDF',
  'View PD',
  'https://apps.cpuc.ca.gov/apex/f?p=401:56:0::NO:RP,57,RIR:P5_PROCEEDING_SELECT:R1910005',
  NULL,
  NULL,
  NULL
);

-- 23. R.10-05-004 — CSI/SGIP Petition Denied
INSERT INTO proceedings
  (docket, section_type, period_label, period_type, period_sort, period_id, date_label, utilities, title, summary, status_text, status_class, primary_link_url, primary_link_text, docket_card_url, ai_details_html, vote_note, anchor_id)
VALUES (
  'R.10-05-004',
  'proposed_decision',
  'Jan 19 – Jan 30, 2026',
  'older',
  4,
  'pd-jan1930',
  'PD Released Jan 21, 2026',
  ARRAY['pge','sce','sdge'],
  'CSI/SGIP — Petition for Modification Denied',
  'Denies a petition to modify the Self-Generation Incentive Program (SGIP) and California Solar Initiative (CSI) incentive structures — Commission finds existing program parameters remain appropriate.',
  'Proposed Decision',
  's-ongoing',
  'https://docs.cpuc.ca.gov/PublishedDocs/Efile/G000/M595/K495/595495666.PDF',
  'View PD',
  'https://apps.cpuc.ca.gov/apex/f?p=401:56:0::NO:RP,57,RIR:P5_PROCEEDING_SELECT:R1005004',
  NULL,
  NULL,
  NULL
);

-- 24. A.24-05-008 — PG&E RAMP Proceeding Close
INSERT INTO proceedings
  (docket, section_type, period_label, period_type, period_sort, period_id, date_label, utilities, title, summary, status_text, status_class, primary_link_url, primary_link_text, docket_card_url, ai_details_html, vote_note, anchor_id)
VALUES (
  'A.24-05-008',
  'proposed_decision',
  'Jan 19 – Jan 30, 2026',
  'older',
  4,
  'pd-jan1930',
  'PD Released Jan 30, 2026',
  ARRAY['pge'],
  'PG&E — Risk Assessment Mitigation Phase (RAMP) Proceeding Close',
  'Proposed Decision to close PG&E''s RAMP proceeding — confirms the RAMP record is accepted as informational and incorporated into the 2026 General Rate Case (A.23-06-009).',
  'Proposed Decision',
  's-ongoing',
  'https://docs.cpuc.ca.gov/PublishedDocs/Efile/G000/M596/K902/596902581.PDF',
  'View PD',
  'https://apps.cpuc.ca.gov/apex/f?p=401:56:0::NO:RP,57,RIR:P5_PROCEEDING_SELECT:A2405008',
  NULL,
  NULL,
  NULL
);

-- 25. I.23-03-008 — Gas Spike ALJ PD Released (Older Period / Jan)
INSERT INTO proceedings
  (docket, section_type, period_label, period_type, period_sort, period_id, date_label, utilities, title, summary, status_text, status_class, primary_link_url, primary_link_text, docket_card_url, ai_details_html, vote_note, anchor_id)
VALUES (
  'I.23-03-008',
  'proposed_decision',
  'Jan 19 – Jan 30, 2026',
  'older',
  4,
  'pd-jan1930',
  'PD Released Jan 23, 2026',
  ARRAY['pge','scg','sdge'],
  'Winter 2022–23 Gas Spike — ALJ Proposed Decision Released',
  'ALJ releases PD proposing to close the gas spike investigation with no misconduct finding and a forward-looking Core Procurement Charge cap. Adopted unanimously Feb 26 — see Mar 2–13 current period above.',
  'Proposed Decision',
  's-ongoing',
  'https://docs.cpuc.ca.gov/PublishedDocs/Efile/G000/M595/K227/595227206.PDF',
  'View PD',
  'https://apps.cpuc.ca.gov/apex/f?p=401:56:0::NO:RP,57,RIR:P5_PROCEEDING_SELECT:I2303008',
  NULL,
  NULL,
  NULL
);
