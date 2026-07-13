import assert from "node:assert/strict";
import test from "node:test";

import {
  parseNativeResponse,
  resolveRoleFile,
} from "../scripts/model/ask-local.mjs";

test("maps SHIELD role aliases to their agent prompts", () => {
  assert.match(resolveRoleFile("orchestrator"), /maria-hill-orchestrator\.agent\.md$/);
  assert.match(resolveRoleFile("implementer"), /melinda-may-implementer\.agent\.md$/);
  assert.match(resolveRoleFile("reviewer"), /leo-fitz-technical-review\.agent\.md$/);
  assert.match(resolveRoleFile("product"), /jemma-simmons-product-feedback\.agent\.md$/);
});

test("extracts reasoning, message, and stats from LM Studio native output", () => {
  const result = parseNativeResponse({
    output: [
      { type: "reasoning", content: " Inspect the repository. " },
      { type: "message", content: " Run the focused test suite. " },
    ],
    stats: { total_output_tokens: 42 },
  });

  assert.equal(result.reasoning, "Inspect the repository.");
  assert.equal(result.message, "Run the focused test suite.");
  assert.equal(result.stats.total_output_tokens, 42);
});

test("rejects responses without an actionable message", () => {
  assert.throws(
    () => parseNativeResponse({ output: [{ type: "reasoning", content: "Thinking" }] }),
    /did not contain a message/,
  );
});
